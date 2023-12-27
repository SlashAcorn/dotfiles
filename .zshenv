# LINUX FROM SCRATCH
export LFS="/mnt/lfs"

# default apps
export EDITOR="emacs"
export TERMINAL="kitty"
export BROWSER="firefox"

# Adds ~/.local/bin and subfolders to $PATH
export PATH="$PATH:${$(find ~/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

# Spicetify to Path
export PATH="$PATH:$HOME/.spicetify:$HOME/.local/bin"

# cleaning up home folder
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_PICTURES_DIR="$HOME/pic"
export XDG_VIDEOS_DIR="$HOME/vid"
export XDG_DESKTOP_DIR="$HOME/dkt"
export XDG_DOCUMENTS_DIR="$HOME/doc"

export PATH="/home/nhe/.turso:$PATH"

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export VIMINIT="set nocp | source ${XDG_CONFIG_HOME:-$HOME/.config}/vim/vimrc"

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export WINEPREFIX="$XDG_DATA_HOME"/wine
export HYPRLAND_INTERACTIVE_SCREENSHOT_SAVEDIR="$HOME"/pic/screenshots/

export LESSHISTFILE="-"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export ZDOTDIR="$HOME/.config/zsh"
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export HISTFILE="$HOME/.config/zsh/zsh-history"

export MANPAGER="less -R --use-color -Dd+r -Du+b"

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

. "/home/nhe/.local/share/cargo/env"
