personal arch + i3wm dotfiles · managed with [stow](https://www.gnu.org/software/stow/)

---

## screenshots

| desktop | terminal | neovim |
|---------|----------|--------|
| ![](ss/desktop.png) | ![](ss/terminal.png) | ![](ss/neovim1.png) |

## stack

| component | what |
|-----------|------|
| wm | i3wm |
| term | kitty |
| shell | bash |
| editor | neovim 0.12+ |
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
sudo pacman -S --needed stow i3-wm kitty neovim tmux thunar \
  thunar-volman tumbler gvfs gvfs-mtp gvfs-afc gvfs-gphoto2 \
  gvfs-smb gvfs-nfs udisks2 polkit polkit-gnome dmenu flameshot \
  brightnessctl i3status xclip fzf ripgrep tree-sitter-cli \
  python-virtualenv python-pip base-devel xdg-user-dirs \
  xcompmgr xwallpaper network-manager-applet blueman
```

node.js via [nvm](https://github.com/nvm-sh/nvm).

## font

```bash
sudo pacman -S otf-geist-mono-nerd
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

## post

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

[i3wm](https://i3wm.org) · [neovim](https://neovim.io) · [stow](https://www.gnu.org/software/stow) · [tmux](https://github.com/tmux/tmux) · [kitty](https://sw.kovidgoyal.net/kitty) · [thunar](https://docs.xfce.org/xfce/thunar/start) · [arch](https://archlinux.org)