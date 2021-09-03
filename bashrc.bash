
# This is only the end part which I added to my default .bashrc

PS1="\033[38;5;203m stem@manjaro\033[m \033[38;5;33m~ [\033[m \w \033[38;5;33m]\033[m \033[38;5;203m»\033[m \[\e[0m\]"

cd workspace
echo "" && neofetch

# Aliases
alias neofetch-config="vim ~/.config/neofetch/config.conf"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias ll="ls -la"
alias neofetch="echo "" && neofetch"
alias lp="ls -l"
alias gohome="cd /home/stem/ && cat .at-home.txt"

export PATH=${HOME}/tools/vim/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

