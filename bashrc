# ~/.bashrc config ->  by: lae-laps
[[ $- != *i* ]] && return

# End of prompt ( PS1 )
prompt_end="#"

#PS1="\033[38;5;82m \w\033[m \033[38;5;9m$prompt_end \033[m"
PS1="\033[38;5;27m \w\033[m \033[38;5;196m$prompt_end \033[m"

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
alias neofetch="neofetch | lolcat"
#alias vim="bash ~/.polyvim/start.sh"
alias v="vim"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
