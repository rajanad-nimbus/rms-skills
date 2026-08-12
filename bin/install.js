#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

console.log('📦 Installing RMS Skills into project...');

const targetDir = process.cwd();
const repoUrl = 'https://github.com/rajanad-nimbus/rms-skills.git';

try {
  const skillsDir = path.join(targetDir, '.agents', 'skills');
  fs.mkdirSync(skillsDir, { recursive: true });
  
  console.log('📥 Cloning RMS Skills repository...');
  execSync(`git clone --depth 1 ${repoUrl} "${path.join(targetDir, '.agents', 'rms-skills')}"`, { stdio: 'inherit' });
  
  console.log('✅ Successfully installed RMS Skills into .agents/rms-skills');
  console.log('💡 Ensure your .agents/skills.json includes:');
  console.log(JSON.stringify({
    "inherits": [
      { "path": "./rms-skills/skills.json" }
    ]
  }, null, 2));
} catch (err) {
  console.error('❌ Installation failed:', err.message);
  process.exit(1);
}
