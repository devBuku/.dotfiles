personal ubuntu + i3wm dotfiles · managed with [stow](https://www.gnu.org/software/stow/)

---

## stack

| component | what |
|-----------|------|
| wm | i3wm |
| term | kitty |
| shell | bash |
| editor | neovim 0.12+ (build from source) |
| mux | tmux |
| files | thunar |
| launch | dmenu |
| font | geistmono nerd font |

## usage

```bash
git clone https://github.com/devbuku/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow i3 kitty nvim tmux flameshot xorg scripts
```

> **!** `stow bash` overwrites `~/.bashrc` — review first.

## packages

```bash
sudo apt install stow i3 kitty tmux thunar thunar-volman tumbler \
  gvfs gvfs-mtp gvfs-afc gvfs-gphoto2 gvfs-smb gvfs-nfs \
  udisks2 policykit-1-gnome dmenu flameshot brightnessctl \
  i3status xclip fzf ripgrep python3-venv python3-pip \
  build-essential xdg-user-dirs xcompmgr network-manager-gnome \
  blueman ripgrep
```

node.js via [nvm](https://github.com/nvm-sh/nvm).

> `policykit-1-gnome` provides `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1`.  
> `build-essential` is needed to compile neovim from source.

## neovim

Ubuntu's repos ship an old neovim. Build 0.12+ from source:

```bash
sudo apt install build-essential cmake gettext lua5.1 liblua5.1-0-dev
git clone https://github.com/neovim/neovim.git /tmp/neovim
cd /tmp/neovim && make CMAKE_BUILD_TYPE=Release && sudo make install
```

Or grab a [release binary](https://github.com/neovim/neovim/releases).

## font

```bash
mkdir -p ~/.fonts && cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/GeistMono.zip
unzip GeistMono.zip && rm GeistMono.zip && fc-cache -fv
```

## laptop

```bash
sudo cp touchpad-tap.conf /etc/X11/xorg.conf.d/
```

enables tap-to-click.

## notes

- **bash** → aliases, nvm, tmux-sessionizer on `C-f`
- **tmux** → prefix `C-b`, sessionizer `f`, pane nav `M-hjkl`
- **nvim** → kickstart, neo-tree, copilot, autopairs, git, gruvbox
- **thunar** → usb/android/iphone/shares via gvfs + udisks2
- **i3** → `xorg/.xinitrc`: xcompmgr, xwallpaper, polkit, caps→esc, exec i3

## post install

```bash
xdg-user-dirs-update
sudo systemctl enable --now udisks2
```

## layout

| dir | what |
|-----|------|
| `i3/` | i3 config |
| `kitty/` | kitty config |
| `nvim/` | neovim config |
| `tmux/` | tmux config |
| `bash/` | .bashrc |
| `xorg/` | .xinitrc |
| `scripts/` | tmux-sessionizer |
| `flameshot/` | flameshot config |
| `touchpad-tap.conf` | xorg touchpad (manual cp) |

## credits

[i3wm](https://i3wm.org) · [neovim](https://neovim.io) · [stow](https://www.gnu.org/software/stow) · [tmux](https://github.com/tmux/tmux) · [kitty](https://sw.kovidgoyal.net/kitty) · [thunar](https://docs.xfce.org/xfce/thunar/start)