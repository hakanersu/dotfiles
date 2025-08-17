function ydl() {
  youtube-dl --extract-audio --audio-format mp3 "$@" --ignore-errors -o '%(title)s.%(ext)s'
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
function ac() {
  git add -A
  git commit -m "$@"
}
function c() {
  git commit -m "$@"
}
function serve() {
  php -S localhost:"$@"
}
function addignore() {
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
