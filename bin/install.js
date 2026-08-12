#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const os = require('os');
const { execSync } = require('child_process');

const args = process.argv.slice(2);
let target = 'all';
let scope = 'local';
let version = 'v1.0.0';

for (let i = 0; i < args.length; i++) {
  if (args[i] === '--target' || args[i] === '-t') {
    target = args[i + 1] || 'all';
    i++;
  } else if (args[i] === '--scope' || args[i] === '-s') {
    scope = args[i + 1] || 'local';
    i++;
  } else if (args[i] === '--version' || args[i] === '-v') {
    version = args[i + 1] || 'v1.0.0';
    i++;
  } else if (['claude', 'gemini', 'openai', 'all'].includes(args[i])) {
    target = args[i];
  } else if (['global', 'local'].includes(args[i])) {
    scope = args[i];
  }
}

console.log('==================================================');
echoLog(`  Installing RMS Skills (${version})`);
echoLog(`  Target Assistant : ${target}`);
echoLog(`  Scope            : ${scope}`);
console.log('==================================================');

function echoLog(msg) {
  console.log(msg);
}

const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'rms-skills-'));

try {
  echoLog('📥 Fetching repository...');
  execSync(`git clone --branch ${version} --depth 1 https://github.com/rajanad-nimbus/rms-skills.git "${tmpDir}"`, { stdio: 'ignore' });
} catch (e) {
  execSync(`git clone https://github.com/rajanad-nimbus/rms-skills.git "${tmpDir}"`, { stdio: 'ignore' });
}

function copyDirSync(src, dest) {
  fs.mkdirSync(dest, { recursive: true });
  const entries = fs.readdirSync(src, { withFileTypes: true });
  for (let entry of entries) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);
    if (entry.isDirectory()) {
      copyDirSync(srcPath, destPath);
    } else {
      fs.copyFileSync(srcPath, destPath);
    }
  }
}

function installTarget(sys) {
  const home = os.homedir();
  const cwd = process.cwd();
  let skillPaths = [];
  let configPaths = [];

  if (scope === 'global') {
    if (sys === 'claude' || sys === 'all') {
      skillPaths.push(path.join(home, '.claude', 'skills'));
      configPaths.push(path.join(home, '.claude', 'skills.json'));
    }
    if (sys === 'gemini' || sys === 'all') {
      skillPaths.push(path.join(home, '.gemini', 'config', 'skills'));
      configPaths.push(path.join(home, '.gemini', 'config', 'skills.json'));
    }
    if (sys === 'openai' || sys === 'all') {
      skillPaths.push(path.join(home, '.openai', 'skills'));
      configPaths.push(path.join(home, '.openai', 'skills.json'));
    }
    skillPaths.push(path.join(home, '.agents', 'skills'));
    configPaths.push(path.join(home, '.agents', 'skills.json'));
  } else {
    if (sys === 'claude' || sys === 'all') {
      skillPaths.push(path.join(cwd, '.claude', 'skills'));
      configPaths.push(path.join(cwd, '.claude', 'skills.json'));
    }
    if (sys === 'gemini' || sys === 'all') {
      skillPaths.push(path.join(cwd, '.agents', 'skills'));
      configPaths.push(path.join(cwd, '.agents', 'skills.json'));
    }
    if (sys === 'openai' || sys === 'all') {
      skillPaths.push(path.join(cwd, '.openai', 'skills'));
      configPaths.push(path.join(cwd, '.openai', 'skills.json'));
    }
    skillPaths.push(path.join(cwd, '.agents', 'skills'));
    configPaths.push(path.join(cwd, '.agents', 'skills.json'));
  }

  const srcSkills = path.join(tmpDir, 'skills');
  const srcConfig = path.join(tmpDir, 'skills.json');
  const srcAgents = path.join(tmpDir, 'AGENTS.md');

  for (let dest of skillPaths) {
    echoLog(`📦 Installing skills -> ${dest}`);
    copyDirSync(srcSkills, dest);
  }

  for (let conf of configPaths) {
    echoLog(`⚙️ Configuring manifest -> ${conf}`);
    fs.mkdirSync(path.dirname(conf), { recursive: true });
    fs.copyFileSync(srcConfig, conf);
    if (fs.existsSync(srcAgents)) {
      fs.copyFileSync(srcAgents, path.join(path.dirname(conf), 'AGENTS.md'));
    }
  }
}

installTarget(target);

fs.rmSync(tmpDir, { recursive: true, force: true });

console.log('');
console.log('==================================================');
console.log('🎉 RMS Skills setup completed successfully!');
console.log(`Assistant Ecosystem : ${target}`);
console.log(`Scope               : ${scope}`);
console.log(`Version             : ${version}`);
console.log('==================================================');
