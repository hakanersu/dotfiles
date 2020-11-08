# Quality of life
alias subl="subl -a"
alias untar='tar -zxvf'
alias untarxz='tar -xJf'
alias creset="source ~/.zshrc"
alias ls='ls -X -h --group-directories-first --color'
alias build-source='./configure && make && sudo make install'
alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

# Git aliases
alias s='git status'
alias pop="git stash pop"
alias stash="git stash -u"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias git-discard='git clean -df; git checkout -- .'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# System aliases
alias sudo='sudo '
alias clean='sudo apt clean'
alias purge='sudo apt purge'
alias search='sudo apt search'
alias update='sudo apt update'
alias remove='sudo apt remove'
alias install='sudo apt install'
alias upgrade='sudo apt upgrade'
alias autoremove='sudo apt autoremove'
alias dist-upgrade='sudo apt dist-upgrade'


# Laravel
alias art='php artisan'

# Docker
dstop() { docker stop $(docker ps -q); }

function ydl() {
	youtube-dl --extract-audio --audio-format mp3 "$@" --ignore-errors  -o '%(title)s.%(ext)s'
}

function green() {
	echo "\e[0;32m$@\e[0m"
}

function enter() {
	CONTAINER=$(docker ps | grep "$@" | awk '{ print $1 }')
	green "Entering container: $CONTAINER with name $@\e[0m"
	docker exec -it $CONTAINER /bin/bash
}

function doc() {
	docker-compose "$@"
}

function ac(){
	git add -A
	git commit -m "$@"
}

function c(){
	git commit -m "$@"
}

function serve(){
	php -S localhost:"$@"
}

#dont forget to set :  git config --global push.default matching
function gitall()
{
	git add -A 
	git commit -m "$@"
	git push
}

#add .gitignore after project
function addignore(){
	git rm -r --cached .
	git add .
	git commit -m ".gitignore is now working"
}

function mkd() {
	mkdir -p "$@" && cd "$@"
}
 
function zombie() {
	ps aux | awk '{if ($8=="Z") { print $2 }}'
}

function removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

function armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}