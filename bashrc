# by: laelaps
[[ $- != *i* ]] && return
prompt_end="#"
PS1="\033[38;5;4m \w\033[m \033[38;5;9m$prompt_end \033[m"
export PATH=${HOME}/tools/vim/bin:$PATH
alias ls='ls --color=auto'
alias ll="ls -lA"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias i3-config="vim ~/.config/i3/config"
alias vim="bash ~/.polyvim/start.sh"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
