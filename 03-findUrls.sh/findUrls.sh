#!/usr/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ "$1" == "" ]; then
	echo -e "${RED}Error: Please enter first arg (directory name)${NC}"
	exit
elif [ -d $1 ]; then
	echo -e "${RED}Error: This directory already exist${NC}"
	exit
fi
if [ "$2" == "" ]; then
	echo -e "${RED}Error: Please enter second arg (page url)${NC}"
	exit
fi


mkdir $1; cd $1;
wget -O page_source $2
( cat page_source | sed -e 's/http/\nhttp/g' -e 's/\.mp3/\.mp3\n/g' ) >sed
( cat sed | egrep -o 'http.+(\.mp3)$' ) >links
( sort links | uniq ) >links.txt
rm page_source sed links

echo -e "${GREEN}Here your links, Please accept links after review them in vim:${NC}"; sleep 4;
vim links.txt

echo -e "Do You Want Download all links now?(Y/n)"
read is_dl
if [ "$is_dl" == "n" ]; then
	echo -e "${GREEN}Your urls created in $(pwd)/links.txt ${NC}"
	exit
fi
for i in $(cat links.txt); do
	wget -P ./downloads/ $i
done

echo -e "${GREEN}Downloads successfuly completed${NC}"
