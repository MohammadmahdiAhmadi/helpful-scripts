#!/bin/bash

echo "Enter username:"
read USERNAME
echo "Enter password:"
read -s PASSWORD

### UNCOMMENT IF YOU WANT RUN ON STARTUP ###
# USERNAME=9010000
# PASSWORD=YOUR_PASSWORD

curl_output=$(curl -s 'https://internet.iut.ac.ir/login' \
  -H 'authority: internet.iut.ac.ir' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'cache-control: max-age=0' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'origin: https://internet.iut.ac.ir' \
  -H 'referer: https://internet.iut.ac.ir/logout?' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
  --data-raw "dst=%24%28link-orig%29&popup=true&username=${USERNAME}&password=${PASSWORD}" \
  --compressed
)

if [ "$curl_output" != "" ]; then 
	echo "Username or password is incorrect"
else
	echo "You successfully connected to your iut internet account"
fi
