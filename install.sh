#!/usr/bin/env bash
set -e

# Defaults
AGENT_TARGET="all" # claude, gemini, openai, all
SCOPE="local"       # local, global
VERSION="v1.0.0"
REPO_URL="https://github.com/rajanad-nimbus/rms-skills.git"

# Usage help
show_help() {
    cat << EOF
Usage: install.sh [OPTIONS]

Options:
  --target, -t <claude|gemini|openai|all>   Target AI assistant ecosystem (default: all)
  --scope, -s <local|global>               Install scope (default: local workspace)
  --version, -v <version>                   Version tag or branch (default: v1.0.0)
  --help, -h                                Show this help message

Examples:
  ./install.sh --target claude --scope global
  ./install.sh --target gemini
  ./install.sh --target openai --scope local
  curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s -- --target claude
EOF
}

# Parse CLI flags
while [[ $# -gt 0 ]]; do
    case "$1" in
        --target|-t)
            AGENT_TARGET="$2"
            shift 2
            ;;
        --scope|-s)
            SCOPE="$2"
            shift 2
            ;;
        --version|-v)
            VERSION="$2"
            shift 2
            ;;
        --help|-h)
            show_help
            exit 0
            ;;
        claude|gemini|openai|all)
            AGENT_TARGET="$1"
            shift
            ;;
        global|local)
            SCOPE="$1"
            shift
            ;;
        *)
            if [[ "$1" =~ ^v[0-9] ]]; then
                VERSION="$1"
            fi
            shift
            ;;
    esac
done

echo "=================================================="
echo "  Installing RMS Skills (${VERSION})"
echo "  Target Assistant : ${AGENT_TARGET}"
echo "  Install Scope    : ${SCOPE}"
echo "=================================================="

TMP_CLONE_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_CLONE_DIR"' EXIT

echo "📥 Fetching RMS Skills repository (${VERSION})..."
git clone --branch "$VERSION" --depth 1 "$REPO_URL" "$TMP_CLONE_DIR" > /dev/null 2>&1 || git clone "$REPO_URL" "$TMP_CLONE_DIR" > /dev/null 2>&1

copy_skills() {
    local DEST_DIR="$1"
    echo "📦 Installing skills into: ${DEST_DIR}"
    mkdir -p "${DEST_DIR}"
    cp -r "${TMP_CLONE_DIR}/skills/"* "${DEST_DIR}/"
}

copy_config() {
    local DEST_CONF="$1"
    echo "⚙️ Configuring skills manifest in: ${DEST_CONF}"
    mkdir -p "$(dirname "$DEST_CONF")"
    cp "${TMP_CLONE_DIR}/skills.json" "${DEST_CONF}"
    if [ -f "${TMP_CLONE_DIR}/AGENTS.md" ]; then
        cp "${TMP_CLONE_DIR}/AGENTS.md" "$(dirname "$DEST_CONF")/AGENTS.md"
    fi
}

install_for_target() {
    local SYS="$1"
    echo ""
    echo "--- Configuring for ${SYS} (${SCOPE}) ---"

    if [ "$SCOPE" = "global" ]; then
        case "$SYS" in
            claude)
                copy_skills "$HOME/.claude/skills"
                copy_skills "$HOME/.agents/skills"
                copy_config "$HOME/.claude/skills.json"
                copy_config "$HOME/.agents/skills.json"
                ;;
            gemini)
                copy_skills "$HOME/.gemini/config/skills"
                copy_config "$HOME/.gemini/config/skills.json"
                ;;
            openai)
                copy_skills "$HOME/.openai/skills"
                copy_skills "$HOME/.agents/skills"
                copy_config "$HOME/.openai/skills.json"
                copy_config "$HOME/.agents/skills.json"
                ;;
            all)
                copy_skills "$HOME/.agents/skills"
                copy_config "$HOME/.agents/skills.json"
                copy_skills "$HOME/.claude/skills"
                copy_skills "$HOME/.gemini/config/skills"
                copy_skills "$HOME/.openai/skills"
                ;;
        esac
    else
        case "$SYS" in
            claude)
                copy_skills ".claude/skills"
                copy_skills ".agents/skills"
                copy_config ".claude/skills.json"
                copy_config ".agents/skills.json"
                ;;
            gemini)
                copy_skills ".agents/skills"
                copy_config ".agents/skills.json"
                ;;
            openai)
                copy_skills ".openai/skills"
                copy_skills ".agents/skills"
                copy_config ".openai/skills.json"
                copy_config ".agents/skills.json"
                ;;
            all)
                copy_skills ".agents/skills"
                copy_config ".agents/skills.json"
                copy_skills ".claude/skills"
                copy_skills ".openai/skills"
                ;;
        esac
    fi
}

if [ "$AGENT_TARGET" = "all" ]; then
    install_for_target "claude"
    install_for_target "gemini"
    install_for_target "openai"
else
    install_for_target "$AGENT_TARGET"
fi

echo ""
echo "=================================================="
echo "🎉 RMS Skills installation successful!"
echo "Target Assistant : ${AGENT_TARGET}"
echo "Scope            : ${SCOPE}"
echo "Version          : ${VERSION}"
echo "=================================================="
