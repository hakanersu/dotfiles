#!/bin/sh

loc=$(curl -s ipinfo.io | jq '.loc' | sed 's/"//g')

lat=$(echo $loc | cut -d',' -f1)
long=$(echo $loc | cut -d',' -f2)

weather=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude="$lat"&longitude="$long"&current=temperature,weathercode")

tem=$(echo $weather | jq '.current.temperature')
wea=$(echo $weather | jq '.current.weathercode')

clear=("0" "1")
cloudy=("2" "3")
fog=("45" "48")
drizzle=("51" "53" "55" "56" "57")
rain=("61" "63" "65" "66" "67")
snow=("71" "73" "75" "77" "85" "86")
showers=("80" "81" "82")
thunderstorm=("95" "96" "99")

if [[ ${clear[@]} =~ $wea ]]; then
  curwea=
elif [[ ${cloudy[@]} =~ $wea ]]; then
  curwea=
elif [[ ${fog[@]} =~ $wea ]]; then
  curwea=
elif [[ ${drizzle[@]} =~ $wea ]]; then
  curwea=
elif [[ ${rain[@]} =~ $wea ]]; then
  curwea=
elif [[ ${snow[@]} =~ $wea ]]; then
  curwea=󰼶
elif [[ ${showers[@]} =~ $wea ]]; then
  curwea=
elif [[ ${thunderstorm[@]} =~ $wea ]]; then
  curwea=
fi

echo $curwea $tem
