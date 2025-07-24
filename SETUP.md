# NPM Publishing Setup Guide

## 🎯 Overview
This guide will help you set up automatic NPM publishing for ClawTree. Once completed, every time you push a version tag to GitHub, your package will automatically be published to NPM.

## 📋 Prerequisites
- GitHub account
- NPM account

## 🔧 Setup Steps

### 1. Create GitHub Repository
1. Go to https://github.com/new
2. Repository name: `clawtree`
3. Make it public (required for free NPM publishing)
4. Don't initialize with README (we already have files)
5. Click "Create repository"

### 2. Push Code to GitHub
```bash
# Initialize git repo
git init
git add .
git commit -m "Initial commit: ClawTree CLI with auto-publishing setup"

# Add remote and push
git remote add origin https://github.com/joshuamullet/clawtree.git
git branch -M main
git push -u origin main
```

### 3. Set Up NPM Token
1. Go to https://www.npmjs.com/
2. Log in to your account
3. Click your profile → "Access Tokens"
4. Click "Generate New Token" → "Classic Token"
5. Select "Automation" (for CI/CD)
6. Copy the token (starts with `npm_`)

### 4. Add NPM Token to GitHub Secrets
1. Go to your GitHub repo: https://github.com/joshuamullet/clawtree
2. Click "Settings" tab
3. In sidebar, click "Secrets and variables" → "Actions"
4. Click "New repository secret"
5. Name: `NPM_TOKEN`
6. Value: Paste your NPM token
7. Click "Add secret"

### 5. Test the Setup
```bash
# Create and push your first version tag
npm run patch  # This bumps version to 1.0.1 and creates a git tag
# The postversion script will automatically push the tag

# Or manually:
# git tag v1.0.0
# git push origin v1.0.0
```

## 🚀 Publishing Workflow

Once set up, your publishing workflow is:

```bash
# For patch releases (1.0.0 → 1.0.1)
npm run patch

# For minor releases (1.0.0 → 1.1.0) 
npm run minor

# For major releases (1.0.0 → 2.0.0)
npm run major
```

Each command will:
1. Bump the version in package.json
2. Create a git commit with the version bump
3. Create a git tag (e.g., v1.0.1)
4. Push the commit and tag to GitHub
5. GitHub Actions will automatically publish to NPM
6. Create a GitHub release

## 📦 Installation for Users

Once published, users can install globally with:
```bash
npm install -g clawtree
```

## 🔍 Monitoring

- Check GitHub Actions: https://github.com/joshuamullet/clawtree/actions
- Check NPM package: https://www.npmjs.com/package/clawtree
- View releases: https://github.com/joshuamullet/clawtree/releases

## 🐛 Troubleshooting

**If publishing fails:**
1. Check GitHub Actions logs
2. Verify NPM_TOKEN is correctly set in GitHub secrets
3. Ensure package name "clawtree" isn't taken on NPM
4. Make sure repository is public

**If you need to publish manually:**
```bash
npm login
npm publish
```