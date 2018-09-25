# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH
ZSH_THEME="materialshell"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# POWERLINE
POWERLINE_RIGHT_A="mixed"
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_NO_BLANK_LINE="true"
POWERLINE_PATH="short"


plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions zshmarks sudo sublime)

autoload -U compinit && compinit

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.scripts:$HOME/.yarn/bin:$HOME/.gem/ruby/2.4.0/bin"

source $ZSH/oh-my-zsh.sh

# TMUX
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='vim'

# BINDINGS
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

alias vpn="sudo openvpn --config $HOME/.scripts/client.ovpn"
alias clipboard="xclip -selection clipboard"
alias vimf='vim "$(fzf --height 95%)"'

alias t='python ~/.scripts/t.py --task-dir ./ --list .todo --delete-if-empty'

# ALIAS MASTER
alias LEIAassembleur="$HOME/Master/M1if08\ -\ Compilation/leia/assembleur/asm.py"
alias LEIAsimulation="$HOME/Master/M1if08\ -\ Compilation/leia/simulateur/LEIA"

export CLASSPATH="$HOME/Master/Multi-Agents/JADE-all-4.5.0/JADE-bin-4.5.0/jade/lib/jade.jar:$HOME/Master/Multi-Agents/JADE-all-4.5.0/JADE-examples-4.5.0/jade/lib/jadeExamples.jar"
alias jade="java jade.Boot -gui"

# FUNCTIONS
vps () {
	#ssh $1@etlf.fr
	mosh $1@etlf.fr
}

newmake () {
	sed "s/current_date/`date +%d.%m.%Y`/" /home/eti/Documents/Makefilebase > Makefile
}

mkcd () {
	mkdir $1
	cd $1
}

cs () {
	cd $1
	ls
}

search () {
	pacaur -Ss $1
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
man() {
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	command man "$@"
}

