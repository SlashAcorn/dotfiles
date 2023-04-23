#
# ~/.bashrc
#
#[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach
# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

#   ALIAS
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='exa -a --color=auto'
    alias sl='exa -a --color=auto'
    alias dc='cd'
    alias ..='cd ..'
    alias .2='cd ../..'
    alias .3='cd ../../..'
    alias .4='cd ../../../..'
    alias .5='cd ../../../../..'
    alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
    alias update='yay -Syu'
    alias dir='dir --color=auto'
    alias apt='echo use pacman.'
    alias updown='sudo pacman -Syu; sudo shutdown now'
    alias upboot='sudo pacman -Syu; sudo reboot'
    alias upspend='sudo pacman -Syu; systemctl suspend'
    alias transfer='kitty +kitten transfer'
    alias grep='grep --color=auto'
fi

eval "$(starship init bash)"

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

neofetch
#[[ ${BLE_VERSION-} ]] && ble-attach
