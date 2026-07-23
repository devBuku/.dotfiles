Personal Arch Linux + i3wm dotfiles — clean, keyboard-driven, and beginner-friendly.

This repository is managed with [GNU Stow](https://www.gnu.org/software/stow/) so each application's config lives in its own directory and can be deployed independently.

---

## Screenshots

### Desktop

![Desktop](ss/desktop.png)

### Terminal (Kitty + tmux)

![Terminal](ss/terminal.png)

### Neovim

![Neovim](ss/neovim1.png)

---

## Features

| Component     | Choice                                         |
|---------------|-------------------------------------------------|
| Window Manager| i3wm (tiling, keyboard-driven)                  |
| Terminal      | Kitty (GPU-accelerated, configurable)           |
| Shell         | Bash with custom aliases and extras             |
| Editor        | Neovim 0.12+ (kickstart.nvim based)            |
| Multiplexer   | tmux with tmux-sessionizer                      |
| File Manager  | Thunar with full volume/device support          |
| Launcher      | dmenu                                           |
| Screenshots   | Flameshot                                       |
| Dotfile Mgmt  | GNU Stow                                        |
| Font          | GeistMono Nerd Font (icon/ligature support)     |

---

## Installation

### Prerequisites

- Arch Linux (or any distro with GNU Stow available)
- `git`
- Basic familiarity with the terminal

### Clone

```bash
git clone https://github.com/devbuku/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### Deploy with Stow

[GNU Stow](https://www.gnu.org/software/stow/) creates symlinks from each package directory into your home directory, keeping your `~` clean while your configs stay version-controlled in one place.

```bash
stow i3
stow kitty
stow nvim
stow tmux
stow bash
stow flameshot
stow xorg
stow scripts
```

> **Warning:** `stow bash` will overwrite your existing `~/.bashrc`. Review `bash/.bashrc` first — shell config is often machine-specific. Cherry-pick what you need rather than deploying blindly.

> **Why Stow?** Unlike copying files manually, Stow creates a single source of truth. Edit files in `~/.dotfiles`, commit changes, and redeploy anywhere. No more scattered dotfiles.

To see what Stow will do without applying:

```bash
stow --simulate nvim
```

---

## Required Packages

Install these packages with your package manager (e.g. `pacman -S` on Arch):

| Package                       | Purpose                                                       |
|-------------------------------|---------------------------------------------------------------|
| `stow`                        | Symlink-based dotfile management                              |
| `i3-wm`                       | Tiling window manager                                         |
| `kitty`                       | GPU-accelerated terminal emulator                             |
| `neovim`                      | Modern Vim-based editor                                       |
| `tmux`                        | Terminal multiplexer                                          |
| `thunar`                      | Graphical file manager                                        |
| `thunar-volman`               | Automatic device management for Thunar                        |
| `tumbler`                     | Thumbnail previews in Thunar                                  |
| `gvfs`                        | Virtual filesystem backend (trash, mounts, etc.)              |
| `gvfs-mtp`                    | Android file transfer via MTP                                 |
| `gvfs-afc`                    | iPhone/iPad file transfer                                     |
| `gvfs-gphoto2`                | Camera file transfer                                          |
| `gvfs-smb`                    | Windows/Samba network shares                                  |
| `gvfs-nfs`                    | NFS network shares                                            |
| `udisks2`                     | Disk mounting daemon                                          |
| `polkit`                      | Authentication agent for privileged operations                |
| `polkit-gnome`                | GNOME-style polkit authentication dialog                      |
| `dmenu`                       | Application launcher                                          |
| `flameshot`                   | Screenshot tool with GUI annotation                           |
| `brightnessctl`               | Screen brightness control                                     |
| `i3status`                    | System information bar for i3 (used by default bar config)    |
| `xclip`                       | Clipboard access for tmux yanking                             |
| `fzf`                         | Fuzzy finder (used by tmux-sessionizer)                       |
| `ripgrep`                     | Fast code search (used by Neovim/fzf)                         |
| `tree-sitter-cli`             | Tree-sitter parser (Neovim syntax highlighting)               |
| `python-virtualenv`           | Python virtual environments (Neovim Python support)           |
| `python-pip`                  | Python package installer                                      |
| `base-devel`                  | Build tools (compilers, make, etc.)                           |
| `xdg-user-dirs`               | Standard user directory names (Desktop, Downloads, etc.)      |
| `xcompmgr`                    | Compositor for transparency and shadows                       |
| `xwallpaper`                  | Lightweight wallpaper setter                                  |
| `network-manager-applet`      | System tray applet for Wi-Fi/network management (nm-applet)   |
| `blueman`                     | Bluetooth manager (system tray applet)                        |

> **Node.js** is installed via [nvm](https://github.com/nvm-sh/nvm) (not pacman) — see the Bash section below.

---

## Fonts

**GeistMono Nerd Font** is the primary font across i3, Kitty, and the terminal.

Arch package:

```bash
sudo pacman -S otf-geist-mono-nerd
```

> **Why a Nerd Font?** Nerd Fonts patch popular programming fonts with thousands of glyphs (icons, arrows, powerline symbols). These are required for proper rendering in Neovim statuslines, tmux powerline, and file manager icons. Without them, you'll see blank squares or missing characters.

---

## Laptop Users

Enable tap-to-click by copying the touchpad configuration:

```bash
sudo cp touchpad-tap.conf /etc/X11/xorg.conf.d/
```

This enables **tap-to-click** for libinput-based touchpads. Without it, you'll need to physically press the touchpad button to register clicks.

---

## Bash

The `.bashrc` includes:

- **Aliases** — `ls` with color, `grep` with color, `vi` as a shortcut for `nvim`
- **PATH extensions** — `~/bin`, `~/.local/bin`, `~/.nvm`, `pnpm`
- **nvm** — Node Version Manager (loads `nvm.sh` and bash completion)
- **tmux-sessionizer** — `Ctrl-f` is bound to launch the sessionizer from anywhere

---

## tmux

| Setting        | Value                                     |
|----------------|-------------------------------------------|
| Prefix         | `Ctrl-b` (default)                         |
| Sessionizer    | `Prefix` → `f` (or `Ctrl-f` in Bash)       |
| Copy to clipboard | Visual select → `y` (uses `xclip`)       |
| Window switching | `Alt` + number                           |
| Pane navigation | `Alt` + hjkl                              |

**tmux-sessionizer** is a fuzzy-finder workflow: press `Ctrl-f` (in Bash) or `Prefix` + `f` (in tmux), type a directory name, and instantly jump into (or create) a tmux session rooted at that directory. It integrates with `fzf` for interactive searching.

---

## Neovim

Built on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) for a minimal but powerful editing experience.

**Requirements:**

| Dependency        | Why?                                                    |
|-------------------|---------------------------------------------------------|
| Neovim 0.12+      | Needed for built-in LSP and tree-sitter support          |
| `tree-sitter-cli` | Parses code into syntax trees for better highlighting   |
| Node.js (via nvm) | Some LSP servers and plugins require JavaScript runtime |
| `python-virtualenv` + `python-pip` | Python-based plugins (e.g. pynvim)         |

**Custom plugins included:**

- `neo-tree` — file explorer sidebar
- `copilot` — AI-powered code completions
- `autopairs` — auto-close brackets/quotes
- `git` integration — blame, diff, status
- `colorscheme` — gruvbox

---

## Thunar

Thunar is configured for full device and media support. The GVFS + udisks2 stack handles:

| Action              | Backend                    |
|---------------------|----------------------------|
| USB drives          | `udisks2` + `gvfs`         |
| Android phones      | `gvfs-mtp`                 |
| iPhones             | `gvfs-afc`                 |
| Cameras             | `gvfs-gphoto2`             |
| Network shares (SMB)| `gvfs-smb`                 |
| NFS exports         | `gvfs-nfs`                 |
| Automatic mounting  | `thunar-volman`            |
| Thumbnail previews  | `tumbler`                  |

> **Tip:** After installing these, enable and start `udisks2`:
> ```bash
> sudo systemctl enable --now udisks2
> ```

---

## i3 Startup (`xorg/.xinitrc`)

When starting i3 via `startx`, the `.xinitrc` (managed by Stow under `xorg/`) runs:

```bash
xcompmgr &
xwallpaper --zoom $HOME/Pictures/wallpaper.jpg &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/bin/setxkbmap -option "caps:swapescape" &
exec i3
```

| Command                                | Purpose                                                        |
|----------------------------------------|----------------------------------------------------------------|
| `xcompmgr`                             | Lightweight compositor — enables window transparency & shadows |
| `xwallpaper --zoom ...`                | Sets a wallpaper (replace path with your own image)            |
| `polkit-gnome-authentication-agent-1`  | Shows a GUI password prompt for privileged actions             |
| `setxkbmap -option "caps:swapescape"`  | Remaps **Caps Lock → Escape** (essential for Vim/Neovim users) |
| `exec i3`                              | Launches i3 (replaces the shell process)                       |

---

## Post-Installation

### Update user directories

```bash
xdg-user-dirs-update
```

This creates standard folders (`Desktop`, `Downloads`, `Documents`, etc.) in your home directory.

### Enable udisks2

```bash
sudo systemctl enable --now udisks2
```

### Set your wallpaper

Edit `xorg/.xinitrc` and change the `xwallpaper` path to point to your own image, or place a file at:

```bash
mkdir -p ~/Pictures
cp ~/.dotfiles/wallpaper_desktop.jpg ~/Pictures/wallpaper.jpg
```

---

## Repository Layout

| Directory       | Contents                                   |
|-----------------|--------------------------------------------|
| `i3/`           | i3 window manager config                   |
| `kitty/`        | Kitty terminal emulator config             |
| `nvim/`         | Neovim config (kickstart.nvim based)       |
| `tmux/`         | tmux terminal multiplexer config           |
| `bash/`         | `.bashrc` — shell aliases, env vars, nvm   |
| `flameshot/`    | Flameshot screenshot tool config           |
| `xorg/`         | `.xinitrc` — i3 startup, wallpaper, compositor, key remaps    |
| `scripts/`      | Custom scripts (e.g. `tmux-sessionizer`)   |
| `touchpad-tap.conf` | Xorg touchpad tap-to-click config (manual copy)          |

---

## Customization

- **Wallpaper** — change the path in `.xinitrc` or swap the image in `~/Pictures/`
- **Font** — edit `i3/.config/i3/config` and `kitty/.config/kitty/kitty.conf`
- **Terminal** — modify the `bindsym $mod+Return` line in the i3 config to launch your preferred terminal
- **Keybindings** — all i3 bindings are in `i3/.config/i3/config`; tmux bindings are in `tmux/.config/tmux/tmux.conf`
- **Compositor** — replace `xcompmgr` with `picom` or another compositor in `.xinitrc`
- **Launcher** — swap `dmenu` for `rofi` by uncommenting the relevant line in the i3 config

> **Tip:** After editing any config, redeploy with `stow`:
> ```bash
> stow --restow i3
> ```

---

## FAQ

### Why GNU Stow?

Stow creates symlinks from a single directory into your home folder. This means your dotfiles stay in one Git repository, you never copy files manually, and you can deploy the same configs across multiple machines instantly.

### How do I uninstall a config?

```bash
stow --delete nvim
```

This removes the symlinks Stow created. Your originals in `~/.dotfiles` remain untouched.

### How do I change my terminal?

Edit `i3/.config/i3/config` and change the `bindsym $mod+Return exec` line to launch your terminal of choice (e.g., `alacritty`, `foot`, `urxvt`).

### Why aren't icons showing?

You need a [Nerd Font](https://www.nerdfonts.com/) installed and configured. Install `otf-geist-mono-nerd` (or any other Nerd Font) and make sure it's set in your terminal and i3 config.

### Why isn't my USB drive showing?

Make sure `udisks2` is running:

```bash
sudo systemctl enable --now udisks2
```

Also verify `gvfs` and `thunar-volman` are installed.

### Can I use this with a display manager (SDDM, LightDM, GDM)?

Yes. Most display managers will pick up the i3 session automatically after installing `i3-wm`. Your display manager's session file is usually provided by the package.

### How do I update all configs after pulling changes?

```bash
cd ~/.dotfiles && git pull && stow --restow */
```

---

## Credits

- [i3wm](https://i3wm.org/) — tiling window manager
- [Neovim](https://neovim.io/) — modern Vim
- [GNU Stow](https://www.gnu.org/software/stow/) — dotfile management
- [tmux](https://github.com/tmux/tmux) — terminal multiplexer
- [Kitty](https://sw.kovidgoyal.net/kitty/) — GPU terminal emulator
- [Thunar](https://docs.xfce.org/xfce/thunar/start) — XFCE file manager
- [Arch Linux](https://archlinux.org/) — the OS

