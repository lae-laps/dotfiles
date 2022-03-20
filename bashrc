#    _               _              
#   | |             | |             
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# by laelaps

[[ $- != *i* ]] && return

prompt_end="#"

PS1="\033[38;5;4m \w\033[m \033[38;5;9m$prompt_end \033[m"

export PATH=${HOME}/tools/vim/bin:$PATH

# Aliases

alias ls='ls --color=auto'
alias ll="ls -lA"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias i3-config="vim ~/.config/i3/config"

alias vim="bash ~/.polyvim/start.sh" # polyvim repo will be added later

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
