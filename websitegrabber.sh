#!/bin/bash

# install httrack
sudo apt install httrack

# create directory for the websites if doesn't exist
DIR=/home/kali/websites
if [ ! -d "$DIR" ] # check to see if exists
then # make directory
  echo "Making dir for websites @ $DIR..."
  mkdir ~/websites
else
  echo "Dir already exists. Moving on... "
fi

# delete lock file if there is one
if [ -f $DIR/*.lock ]
then
  rm *.lock
fi

# if there already is an index file in the directory just update everything
if [ -f $DIR/index.html ]
  then
    httrack --update
fi

# download hacktricks
hacktricks=https://book.hacktricks.xyz/
if [ ! -f /home/kali/websites/book.hacktricks.xyz ]
  then
  httrack $hacktricks -O ~/websites
fi

# download GTFO bins
gtfobins=https://gtfobins.github.io/
if [ ! -f /home/kali/websites/gtfobins.github.io ]
  then
  httrack $gtfobins -O ~/websites
fi

# download pentest monkey reverse shell cheat sheets
pentestmonkey=https://pentestmonkey.net
if [ ! -f /home/kali/websites/pentestmonkey.net ]
  then
  httrack $pentestmonkey -O ~/websites
fi

echo "Websites are now mirrored to $DIR.\nTo visit:\ncd ~/websites\npython3 -m http.server\nvisit http://localhost:8000/<nameofmirroredwebsitehere>"

