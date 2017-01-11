# Path to your oh-my-zsh installation.
export ZSH=/home/etienne/.oh-my-zsh

# ZSH
ZSH_THEME="hyperzsh"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# POWERLINE
POWERLINE_RIGHT_A="mixed"
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_NO_BLANK_LINE="true"
POWERLINE_PATH="short"

plugins=(git zsh-completions zsh-syntax-highlighting sudo)

autoload -U compinit && compinit

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

source $ZSH/oh-my-zsh.sh

# TMUX
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='vim'

# BINDINGS
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# ALIAS
alias :c="clear"
alias :q="exit"
alias :u="pacaur -Syu"
alias :z="source ~/.zshrc"
alias :r="sudo reboot"
alias :s="sudo shutdown -h now"
alias :l="gnome-session-quit --logout --no-prompt"

alias gnome="XDG_SESSION_TYPE=wayland dbus-run-session gnome-session"

# FUNCTIONS
vps () {
	ssh $1@149.202.55.34
}

mkcd () {
    mkdir $1
    cd $1
}

cs () {
	cd $1
	ls
}

mgcc () {
	gcc -Wall $1.c -o $1.o && ./$1.o
}
mg++ () {
	g++ -Wall -Wextra $1.cpp -o $1.o && ./$1.o
}
mgpp () {
	g++ -Wall -Wextra $1.cc -o $1.o && ./$1.o
}
mgdb () {
    gdb $1 -q -ex "start" -ex "set confirm off" -ex "tui enable"
}
mjavac () {
	javac $1.java && java $1
}
newc () {
    cat ~/.scripts/file.c > $1.c
    vim $1.c
}
newc++ () {
    cat ~/.scripts/file.cc > $1.cpp
    vim $1.cpp
}
matom () {
	cd $1
	atom .
	ls -R
}
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

