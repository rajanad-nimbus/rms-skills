# RMS Skills (Oracle Retail Merchandising System)

![License](https://img.shields.io/badge/license-MIT-green.svg)
![RMS Version](https://img.shields.io/badge/RMS-v16-blue.svg)
![Ecosystems](https://img.shields.io/badge/supported-Claude%20%7C%20Gemini%20%7C%20OpenAI-purple.svg)

An open agent skill library providing comprehensive physical database schemas, **RRL 16 Business Process Models (RRM)**, **Product Domain Architecture (RRA)**, **Retail Service Group (RSG) integration specs**, functional user guides, and batch operations for **Oracle Retail Merchandising System 16 (RMS 16)**, **RPM**, **ReIM**, **ReSA**, and **Allocations**.

Built on the Mat Pocock Open Agent Skill Standard. Compatible with **Claude Code**, **Gemini**, **OpenAI / ChatGPT**, and all Mat Pocock standard agents.

---

## ⚡ Quick Setup for Your AI Assistant

Setup RMS Skills instantly for your AI assistant of choice using **Shell** or **npx**:

### 1. Claude Setup (Claude Code / Anthropic)
Install skills for **Claude Code** (Local workspace or Global):

```bash
# Local workspace setup for Claude
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s -- --target claude --scope local

# Global setup for Claude (~/.claude/skills)
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s -- --target claude --scope global
```

*Or via npx:*
```bash
npx rms-skills --target claude --scope global
```

---

### 2. Gemini Setup (Google Antigravity / Gemini CLI)
Install skills for **Gemini / Antigravity**:

```bash
# Local workspace setup for Gemini (.agents/skills)
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s -- --target gemini --scope local

# Global setup for Gemini (~/.gemini/config/skills)
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s -- --target gemini --scope global
```

*Or via npx:*
```bash
npx rms-skills --target gemini --scope global
```

---

### 3. OpenAI Setup (OpenAI / Codex / ChatGPT Agents)
Install skills for **OpenAI agents**:

```bash
# Local workspace setup for OpenAI (.openai/skills)
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s -- --target openai --scope local

# Global setup for OpenAI (~/.openai/skills)
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s -- --target openai --scope global
```

*Or via npx:*
```bash
npx rms-skills --target openai --scope global
```

---

### 4. Universal / All Assistant Setup
To install skills for **all AI assistants simultaneously** (Claude, Gemini, and OpenAI):

```bash
# Global install across all agent frameworks
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s -- --target all --scope global
```

---

## 📌 Manual / Inheritance Setup (`skills.json`)

Alternatively, inherit skills remotely by updating your project's `.agents/skills.json`, `.claude/skills.json`, `.gemini/config/skills.json`, or `.openai/skills.json`:

```json
{
  "inherits": [
    {
      "path": "https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/skills.json"
    }
  ]
}
```

---

## 📜 License

MIT
