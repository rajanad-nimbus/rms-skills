#!/usr/bin/env bash
set -e

VERSION="${1:-main}"
TARGET_DIR="${2:-.agents/rms-skills}"

echo "=================================================="
echo "  Installing RMS Skills (${VERSION}) -> ${TARGET_DIR}"
echo "=================================================="

mkdir -p "$(dirname "$TARGET_DIR")"

if [ -d "$TARGET_DIR" ]; then
    echo "Updating existing installation in $TARGET_DIR..."
    git -C "$TARGET_DIR" fetch --tags
    git -C "$TARGET_DIR" checkout "$VERSION"
    git -C "$TARGET_DIR" pull origin "$VERSION" || true
else
    echo "Cloning repository..."
    git clone --branch "$VERSION" --depth 1 https://github.com/rajanad-nimbus/rms-skills.git "$TARGET_DIR"
fi

echo ""
echo "✅ Installation complete!"
echo "To register these skills, update your project's .agents/skills.json to inherit:"
echo ""
echo "{"
echo "  \"inherits\": ["
echo "    { \"path\": \"./$(basename "$TARGET_DIR")/skills.json\" }"
echo "  ]"
echo "}"
echo ""
