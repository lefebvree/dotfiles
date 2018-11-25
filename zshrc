
export ZSH=$HOME/.oh-my-zsh
autoload colors && colors

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.scripts:$HOME/.yarn/bin:$HOME/.gem/ruby/2.4.0/bin"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='vim'

# ZSH
ZSH_THEME="spaceship"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions vi-mode)

autoload -U compinit && compinit


source $ZSH/oh-my-zsh.sh

# POWERLINE CONFIG
POWERLINE_RIGHT_A="mixed"
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_NO_BLANK_LINE="true"
POWERLINE_PATH="short"

# SPACESHIP ZSH CONFIG
SPACESHIP_PROMPT_ORDER=(time dir host git venv exec_time line_sep vi_mode jobs exit_code char)
#SPACESHIP_PROMPT_ADD_NEWLINE=false
#SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_CHAR_SYMBOL='→ '
#SPACESHIP_CHAR_COLOR_SUCCESS=grey
SPACESHIP_DIR_TRUNC_PREFIX="…/"
SPACESHIP_DIR_COLOR=blue
SPACESHIP_DIR_PREFIX='» '
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL=' '
SPACESHIP_EXEC_TIME_PREFIX=''
SPACESHIP_GIT_SYMBOL='  '
SPACESHIP_GIT_BRANCH_PREFIX='  '
SPACESHIP_GIT_PREFIX=''
SPACESHIP_GIT_STATUS_DELETED="×"
SPACESHIP_GIT_STATUS_UNTRACKED="•"
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=white
SPACESHIP_TIME_FORMAT="%T"

# ZSH VI-MODE
bindkey -e
#export KEYTIMEOUT=1

# TMUX
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# BINDINGS
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# ALIASES
alias vpn="sudo openvpn --config $HOME/.scripts/client.ovpn"
alias clipboard="xclip -selection clipboard"
alias vimf='vim "$(fzf --height 95%)"'
alias p3="python3"
alias :q="exit"

alias gits="git status -s"
alias gitc="git commit -v"
alias gita="git add"
alias gitp="git push"

# FUNCTIONS
vps () {
	#ssh $1@etlf.fr
	mosh $1@etiennelefebvre.com
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
man() {
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	command man "$@"
}

neofetch ; fortune -e -s -n 300 futurama rickandmorty montypython darkestdungeon | lolcat -h 0.07 -v 0.05

