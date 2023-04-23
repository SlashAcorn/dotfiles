#
# ~/.bash_profile
#
#================================#
# Environment Variables
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
export PATH=$PATH:$HOME/.spicetify:$HOME/.local/bin/
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
export LD_LIBRARY_PATH="$HOME/games/momentum-mod/bin/:/usr/lib/:/usr/local/lib/"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export WINEPREFIX="$XDG_DATA_HOME"/wine
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export WINEPREFIX="$XDG_DATA_HOME"/wine
export LESSHISTFILE=="$XDG_STATE_HOME"/less/history
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export HYPRLAND_INTERACTIVE_SCREENSHOT_SAVEDIR="$HOME/pic/screenshots/"
