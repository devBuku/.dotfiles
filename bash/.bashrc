#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'

PS1='[\u@\h \W]\$ '

# Add user's bin directories to PATH
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bind '"\C-f":"tmux-sessionizer\n"'


# opencode
export PATH=/home/buku/.opencode/bin:$PATH


# Added by Antigravity CLI installer
export PATH="/home/buku/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/home/buku/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# export XDG_DATA_DIRS="$XDG_DATA_DIRS:~/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"
# export PATH="$PATH:~/.local/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin"

