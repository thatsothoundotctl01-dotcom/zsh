 





# Zsh Alacritty
zsh-dotfiles
A complete zsh setup: Zinit plugin manager, Starship prompt with distro icons,
and Alacritty terminal config (transparent, blurred, borderless).
What's included
.zshrc                    → main zsh config (plugins, aliases, history)
config/starship.toml      → prompt config with distro icon examples
config/alacritty.toml     → terminal config, TOML (Alacritty 0.13+)
config/alacritty.yml      → terminal config, YAML (Alacritty < 0.13, legacy)
Only copy one of alacritty.toml or alacritty.yml — never both, or
Alacritty will complain about duplicate/conflicting config. Check your
version first with alacritty --version to know which one you need.
Plugin list (installed automatically by Zinit on first launch)
Plugin	Purpose
zsh-autosuggestions	Ghost-text history suggestions
fast-syntax-highlighting	Colors valid/invalid commands live
zsh-completions	Extra completion definitions
zsh-history-substring-search	Arrow-key history filtering
fzf-tab	Fuzzy tab-completion menu
zsh-you-should-use	Alias reminders
zsh-abbr	Fish-style abbreviation expansion
zsh-autopair	Auto-close brackets/quotes
zsh-z	Frecency-based cd jumping
zsh-command-time	Shows duration of long commands
zsh-bd	Extra cd shortcuts
LS_COLORS	Better colored file listings
eza	Modern ls with icons, git status, tree view
bat	cat with syntax highlighting + line numbers
zoxide	Frecency-based cd — z foldername jumps anywhere
zsh-vi-mode	Vi keybindings with a mode indicator
forgit	Interactive fzf-powered git commands
OMZ: git, sudo, command-not-found, extract, colored-man-pages, docker, docker-compose, systemd	Cherry-picked Oh-My-Zsh plugins
Also included: a Catppuccin Mocha color theme for fzf's popup menus,
set via FZF_DEFAULT_OPTS in .zshrc.
Step-by-step setup (fresh Ubuntu machine)
Install base packages
sudo apt update && sudo apt install -y zsh git curl fzf alacritty
Install Starship (prompt engine)
curl -sS https://starship.rs/install.sh | sh -s -- -y
Install a Nerd Font (needed for icons to render — pick one)
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
Option A: IosevkaTerm Nerd Font Mono
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip
unzip -o IosevkaTerm.zip && rm IosevkaTerm.zip
Option B: FiraCode Nerd Font
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip -o FiraCode.zip && rm FiraCode.zip
fc-cache -fv
fc-list | grep -i nerd   # confirm it installed correctly
Clone this repo and link the configs
git clone https://github.com/<your-username>/zsh-dotfiles.git ~/dotfiles
cp ~/dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.config
cp ~/dotfiles/config/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/alacritty
cp ~/dotfiles/config/alacritty.toml ~/.config/alacritty/alacritty.toml
Set zsh as your default shell
chsh -s $(which zsh)
Log out and back in, then open Alacritty
Zinit bootstraps and installs every plugin automatically the first time
a new zsh session starts — no manual plugin install step needed.
7. (Optional) Enable background blur behind the terminal (GNOME only)
sudo apt install -y gnome-shell-extension-manager
Open Extension Manager → Browse → search "Blur my Shell" → Install → Enable
→ open its settings → Applications section → turn on blur for app windows.
Notes
·	If the OS icon in your prompt shows as a blank box, your font didn't
install correctly, or alacritty.toml's font.normal.family doesn't
match the exact installed font name. Check with fc-list | grep -i <font>.
·	startup_mode in alacritty.toml can be "Fullscreen", "Maximized",
or removed entirely for a normal windowed start.
·	To uninstall a plugin, delete its zinit light ... line from .zshrc
and run zinit delete <plugin-name> inside a zsh session.
