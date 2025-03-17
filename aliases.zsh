eval "$(zoxide init zsh)"
alias ld='eza -lD'
alias lf='eza -lf --color=always | grep -v /'
alias lh='eza -dl .* --group-directories-first'
alias ll='eza -al --group-directories-first'
alias lt='eza -al --sort=modified'
alias ls="eza --icons --long"
# Quality of life
alias subl="subl -a"
alias untar='tar -zxvf'
alias untarxz='tar -xJf'
alias creset="source ~/.zshrc"

alias build-source='./configure && make && sudo make install'
alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
# Git aliases
alias s='git status'
alias pop="git stash pop"
alias stash="git stash -u"
alias gcm="git checkout main"
alias gcd="git checkout develop"
alias git-discard='git clean -df; git checkout -- .'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias zshconfig="nvim ~/.zshrc"
alias be='bundle exec'
alias bi='bundle install'
alias bw='bin/webpack-dev-server'
alias rails-install-and-migrate='ggpull && bundle install && yarn install && bin/rails db:migrate'
alias rails-checkout-schema-changes='gco **/*schema.rb'
alias rails-setup='rails-install-and-migrate && rails-checkout-schema-changes'
alias rc='rails console'
alias add-solargraph-config='cp ~/.config/solargraph/.solargraph.yml ./'
alias vi='nvim'
alias rails-credentials='EDITOR="nvim" rails credentials:edit'
alias rails-credentials-dev='EDITOR="nvim" rails credentials:edit --environment development'
alias rails-credentials-staging='EDITOR="nvim" rails credentials:edit --environment staging'
alias ngrok-rt='~/./ngrok http 5000 --subdomain=remoteteam'

alias lsp-logs='cat /Users/enes.dindas/.cache/nvim/lsp.log'
alias zp-update-gql='bin/rake graphql:prepare && yarn generate-client-types'



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
alias python=/usr/bin/python3
alias server='ruby -run -e httpd . -p 8000'
alias dbnuke='bundle exec rake db:schema:load && bundle exec rake db:seed:replant && bundle exec rake db:migrate; RAILS_ENV=test bundle exec rake db:schema:load && RAILS_ENV=test bundle exec rake db:seed:replant && RAILS_ENV=test bundle exec rake db:migrate'
# Laravel
alias art='php artisan'
alias mfs="php artisan migrate:fresh --seed"
# Docker
dstop() { docker stop $(docker ps -a -q); }


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
function gpull() {
	git pull
	bundle install
	bundle exec rake db:migrate
	yarn
}

function armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}
function gendev() {
	bin/rails runner 'DevAccountCreator.new.create_dev_accounts'
	bin/rails runner 'DemoCompanyBuilder.create_for_dev!'
}
function stopcolima() {
    colima stop -p default
    colima stop gusto
}
