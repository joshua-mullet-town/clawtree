#!/bin/bash

# ClawTree Development Testing Script
# Quick way to test local changes without reinstalling globally

echo "🧪 ClawTree Development Testing Script"
echo "======================================"

# Check if we're in the clawtree directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ ! -f "$SCRIPT_DIR/bin/clawtree" ]]; then
    echo "❌ Error: Must run from clawtree repository root"
    exit 1
fi

# Function to test in a specific repository
test_repo() {
    local repo_path="$1"
    if [[ ! -d "$repo_path" ]]; then
        echo "❌ Repository not found: $repo_path"
        return 1
    fi
    
    if [[ ! -d "$repo_path/.git" ]]; then
        echo "❌ Not a git repository: $repo_path"
        return 1
    fi
    
    echo "🎯 Testing in: $repo_path"
    cd "$repo_path"
    "$SCRIPT_DIR/bin/clawtree"
}

# Quick test options
echo ""
echo "Choose test target:"
echo "1. 🏠 mullet-town (recommended)"
echo "2. 🌲 GiveGrove"
echo "3. 🤖 agent-billy"
echo "4. 📋 Custom path"
echo "5. 📦 Install/Update global version"

read -p "Choice (1-5): " choice

case $choice in
    1)
        test_repo "/Users/joshuamullet/code/mullet-town"
        ;;
    2)
        test_repo "/Users/joshuamullet/code/GiveGrove"
        ;;
    3)
        test_repo "/Users/joshuamullet/code/agent-billy"
        ;;
    4)
        read -p "Enter repository path: " custom_path
        test_repo "$custom_path"
        ;;
    5)
        echo "🔄 Updating global clawtree installation..."
        npm uninstall -g clawtree 2>/dev/null
        npm install -g .
        echo "✅ Global clawtree updated! Use 'clawtree' command anywhere."
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac