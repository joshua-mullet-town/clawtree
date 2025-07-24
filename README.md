# 🌳 ClawTree

A minimal CLI tool for managing Git worktrees with an intuitive terminal interface, designed for Claude Code workflows.

## 🚀 Installation

```bash
npm install -g clawtree
```

## 📖 Usage

Navigate to any git repository and run:

```bash
clawtree
```

This opens an interactive dashboard where you can:

- **➕ Create New Sessions**: Create git worktrees with new branches
- **💬 Launch Claude**: Open Claude Code in a terminal for any worktree
- **💻 Open in VS Code**: Open worktrees in Visual Studio Code
- **🗑️ Delete Sessions**: Clean up worktrees and branches

## ✨ Features

- **Interactive Terminal UI**: Built with [gum](https://github.com/charmbracelet/gum) for a beautiful CLI experience
- **Smart Branch Detection**: Automatically detects your default branch (main, master, etc.)
- **Error Handling**: Clear error messages and retry options for branch creation
- **Session Management**: Organize your work across multiple git worktrees
- **Claude Code Integration**: Seamlessly launch Claude Code sessions

## 🔧 Requirements

- **Git**: Version control (obviously!)
- **gum**: Interactive terminal components ([install instructions](https://github.com/charmbracelet/gum#installation))
- **Node.js**: 16+ (for npm installation)
- **macOS/Linux**: Currently supports Unix-like systems

## 📁 How It Works

ClawTree creates a `.clawtree-sessions/` directory in your git repository root, where each session represents a separate git worktree. This allows you to work on multiple branches simultaneously without switching contexts.

## 🤝 Contributing

Issues and pull requests are welcome! Visit the [GitHub repository](https://github.com/joshuamullet/clawtree).

## 📄 License

MIT License - see LICENSE file for details.