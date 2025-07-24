# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ClawTree is a minimal CLI tool for managing Git worktrees with a terminal UI. It's designed as an NPM-published package that helps developers manage multiple git worktrees through an interactive interface using `gum` for UI components.

## Architecture

- **Single executable**: `/bin/clawtree` - Main bash script containing all functionality
- **Sessions storage**: `.clawtree-sessions/` directory in the root of each git repository
- **Configuration**: `.clawtree-config` file stores user preferences like default base branch
- **Dependencies**: Requires `gum` (charm.sh/gum) for interactive terminal UI components

## Core Components

### Main Functions
- `create_session()`: Creates new git worktrees with branch creation
- `delete_session()`: Removes worktrees and associated branches  
- `open_session()`: Launches Claude Code in a Terminal tab for the worktree
- `open_vscode()`: Opens worktree in VS Code
- `dashboard()`: Main interactive loop using gum for user interface

### Session Management
- Sessions are stored as directories in `.clawtree-sessions/`
- Each session corresponds to a git worktree with its own branch
- Branch names with slashes are converted to hyphens for directory names

## Development Commands

This is a simple bash script project with no build process, tests, or linting configured. The main executable is directly runnable:

```bash
./bin/clawtree
```

## Key Implementation Details

- Uses `git worktree` commands for all worktree operations
- Integrates with macOS Terminal app via AppleScript for session launching
- Stores default base branch preference in `.clawtree-config`
- Current implementation assumes `main` as default branch but allows user override
- No error handling for invalid branches (this is a known issue to be addressed)

## Known Issues

The current implementation has several UX issues around branch creation:
1. No helper text when prompting for source branch
2. Silent failures on invalid branch names
3. Hard-coded assumption of "main" as default branch
4. No branch validation or smart branch detection