# Dotfiles

This repository contains my personal dotfiles and setup configuration for devcontainers and devpods, managed with [chezmoi](https://chezmoi.io/).

## Overview

This setup is designed to quickly configure a consistent development environment across different containers and pods using a `postCreateCommand` in `devcontainer.json`.

## Structure

- **`dot_config/`** - Configuration files managed by chezmoi (the `dot_` prefix represents the actual `.config/` directory)
  - `mise/` - Tool version management configuration
  - `nvim/` - Neovim configuration with LazyVim setup
- **Setup script** - Automated installation and configuration script executed as postCreateCommand

## Tools & Configuration

**Development Tools** (managed via mise):
- Core utilities: `bat`, `fzf`, `lsd`, `ripgrep`
- Git tooling: `lazygit`
- Editor: `neovim` with custom LazyVim configuration
- Dotfiles management: `chezmoi`

**Neovim Setup**:
- LazyVim-based configuration
- Tokyo Night Storm colorscheme
- Language support for JSON, TOML, YAML, and Markdown
- Custom plugins and disabled components for a streamlined experience

## Chezmoi

Chezmoi manages the dotfiles by:
- Tracking configuration files in this repository
- Applying them to the correct locations (`dot_config` → `~/.config`)
- Enabling version control and templating of dotfiles
- Providing consistent deployment across different environments
