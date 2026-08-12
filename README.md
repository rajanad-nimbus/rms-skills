# RMS Skills (Oracle Retail Merchandising System)

![Version](https://img.shields.io/badge/version-v1.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

An open agent skill library providing comprehensive physical database schemas, functional user guides, batch operations, and architectural reference models for Oracle Retail Merchandising System (RMS).

Built on the Mat Pocock Open Agent Skill Standard.

---

## 🚀 Quick Installation

You can install and use these skills in any AI agent setup (Claude Code, Gemini, Antigravity, etc.) using any of the following methods:

### Method 1: One-Line Shell Installer (Recommended)
Run this command from your workspace root:

```bash
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash
```

To install a specific version tag (e.g. `v1.0.0`):
```bash
curl -fsSL https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/main/install.sh | bash -s v1.0.0
```

---

### Method 2: Register via `skills.json` Inheritance
Add inheritance to your existing `.agents/skills.json` or global `skills.json`:

```json
{
  "inherits": [
    {
      "path": "https://raw.githubusercontent.com/rajanad-nimbus/rms-skills/v1.0.0/skills.json"
    }
  ]
}
```

---

### Method 3: Git Submodule or Clone
Clone directly into your workspace `.agents/` folder:

```bash
git submodule add https://github.com/rajanad-nimbus/rms-skills.git .agents/rms-skills
```

Then reference `./rms-skills/skills.json` in your local `.agents/skills.json`.

---

## 📌 Version Tracking

Skill releases and updates are tracked via Semantic Versioning (`vX.Y.Z`).

- Current Version: **`v1.0.0`**
- All releases are published with tagged releases on [GitHub Releases](https://github.com/rajanad-nimbus/rms-skills/releases).
- `skills.json` and `package.json` maintain matching version identifiers for automated version checks.

---

## 📂 Repository Structure

```
├── .agents/
│   ├── AGENTS.md
│   └── skills.json
├── bin/
│   └── install.js
├── skills/
│   ├── rms_purchase_orders/
│   ├── rms_sales_audit_transactions/
│   ├── rms_inventory/
│   ├── rms_stock_ledger_financials/
│   └── ... (80+ skills)
├── install.sh
├── AGENTS.md
├── package.json
├── skills.json
└── README.md
```

## 📖 Usage with AI Agents

1. Once installed, agents discover registered skills automatically via `skills.json`.
2. **Tier 1**: High-level entity summary and domain concepts in `skills/<skill>/SKILL.md`.
3. **Tier 2**: Deep technical schemas and operations guides in `skills/<skill>/references/`.

## 📜 License

MIT
