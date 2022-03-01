# by: laelaps

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='${arch_chroot:+(linux)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export PATH=${HOME}/tools/vim/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias ll="ls -lA"
alias v="vim"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias i3-config="vim ~/.config/i3/config"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
