#    _               _              
#   | |             | |             
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# by: laelaps

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# set language to solve wrapp-around problems 
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#PS1="\033[38;5;82m \w\033[m \033[38;5;9m$prompt_end \033[m"
PS1="\033[38;5;27m \w\033[m \033[38;5;196m# \033[m"

export PATH=${HOME}/tools/vim/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias ll="ls -lAh"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias i3-conf="vim ~/.config/i3/config"
alias polyconf="vim ~/.config/polybar/config"
alias picom-conf="vim ~/.config/picom/picom.conf"
alias kitty-conf="vim ~/.config/kitty/kitty.conf"
alias sd="sudo !!"
#alias neofetch="neofetch | lolcat"
alias please="sudo"
#alias vim="bash ~/.polyvim/start.sh"
alias feh="feh --scale-down"
alias v="vim"
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias build="g++ -o main main.cpp"
alias push="git push"
alias commit="git add --all && git commit -m" # needs description
alias mod1="feh --bg-fill ~/data/pictures/wallpapers/anon.jpg"
alias kssh="kitty +kitten ssh"
alias potion="/home/arch/.potion/bin/potion"
alias clean="rm -rf ~/Documents && rm -rf ~/Desktop && rm -rf ~/Downloads && rm ~/dump.rdb && rm ~/slw.saves && rm ~/backup.lock && rm ~/salwyrr.properties.backup" 
alias cat="cat -v" # avoid escape injections

# Start the starship prompt
#eval "$(starship init bash)"
