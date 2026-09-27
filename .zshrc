#!/usr/bin/env zsh
# ~/.zshrc — Dotfiles config
# Plugin manager: Zinit (fast, no framework overhead)
# https://github.com/zdharma-continuum/zinit

# ---------------------------------------------------------------------------
# Zinit bootstrap (auto-installs itself if missing)
# ---------------------------------------------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ---------------------------------------------------------------------------
# Core plugins
# ---------------------------------------------------------------------------

# Autosuggestions — ghost-text suggestions based on history
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting — colors commands as you type (valid/invalid)
zinit light zdharma-continuum/fast-syntax-highlighting

# Extra completions — huge completion definitions for many CLI tools
zinit light zsh-users/zsh-completions

# History substring search — up/down arrow searches history by substring
zinit light zsh-users/zsh-history-substring-search

# fzf-tab — replaces default tab completion menu with fzf-powered fuzzy menu
zinit light Aloxaf/fzf-tab

# You-should-use — reminds you when an alias exists for a command you typed
zinit light MichaelAquilina/zsh-you-should-use

# zsh-abbr — expands short abbreviations into full commands (like fish)
zinit light olets/zsh-abbr

# Auto-pair brackets/quotes as you type
zinit light hlissner/zsh-autopair

# Fast directory jumping — z <partial-name> jumps to frecent directories
zinit light agkozak/zsh-z

# Shows command duration for long-running commands in the prompt
zinit light popstas/zsh-command-time

# Better `cd` — adds many navigation shortcuts (cdu, cdb, bd, etc.)
zinit light Tarrasch/zsh-bd

# Auto-closes and jumps out of brackets/quotes intelligently
zinit light hlissner/zsh-autopair

# LS_COLORS generator matching your terminal theme
zinit light trapd00r/LS_COLORS

# ---------------------------------------------------------------------------
# Visual / "look good" plugins
# ---------------------------------------------------------------------------

# eza — modern ls replacement with icons, git status, tree view
zinit ice as"command" from"gh-r" mv"eza* -> eza" pick"eza"
zinit light eza-community/eza

# bat — cat replacement with syntax highlighting and line numbers
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat*/bat"
zinit light sharkdp/bat

# zoxide — smarter cd that learns your habits (icons show via eza integration)
zinit ice as"command" from"gh-r" mv"zoxide* -> zoxide" pick"zoxide*/zoxide"
zinit light ajeetdsouza/zoxide

# vi-mode with visual mode indicator in the prompt
zinit light jeffreytse/zsh-vi-mode

# forgit — interactive fzf-powered git UI (fga, fgl, fgd, etc.)
zinit light wfxr/forgit

# Nicer fzf color theme (Catppuccin Mocha, matches dark terminal themes)
export FZF_DEFAULT_OPTS="
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# fastfetch — clean system-info banner shown once per new terminal
# (like neofetch, but faster and prettier by default)
if command -v fastfetch &>/dev/null; then
  fastfetch
fi

# Smooth terminal title updates (shows current dir/command in window title)
zinit light jreese/zsh-titles

# ---------------------------------------------------------------------------
# Oh-My-Zsh snippets (borrow individual plugins without the whole framework)
# ---------------------------------------------------------------------------
zinit snippet OMZP::git
zinit snippet OMZP::sudo          # press ESC twice to prefix last command with sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::extract       # `extract <archive>` handles any archive type
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::systemd

# ---------------------------------------------------------------------------
# Prompt: Starship (config lives in ~/.config/starship.toml)
# ---------------------------------------------------------------------------
eval "$(starship init zsh)"

# ---------------------------------------------------------------------------
# History settings
# ---------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# ---------------------------------------------------------------------------
# Keybindings for history-substring-search
# ---------------------------------------------------------------------------
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ---------------------------------------------------------------------------
# fzf integration (fuzzy Ctrl+R history search, Ctrl+T file search)
# ---------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias lt='eza --tree --icons --level=2'
alias cat='bat --style=plain'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias update='sudo apt update && sudo apt upgrade -y'
alias vim='nvim'

# zoxide replaces cd with frecency-based jumping
eval "$(zoxide init zsh)"
alias cd='z'

# ---------------------------------------------------------------------------
# Completion styling (used by fzf-tab)
# ---------------------------------------------------------------------------
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
