#!/bin/sh

set -x

if [ "$(uname)" = "Darwin" ]; then
  readlink=`which greadlink`
else
  readlink=`which readlink`
fi

basedir=`dirname $($readlink -f $0)`

if ! which curl >/dev/null 2>&1; then
  echo "please install curl: sudo apt install curl"
  exit 1
fi
if ! which jq >/dev/null 2>&1; then
  echo "please install jq: sudo apt install jq"
  exit 1
fi
if ! which gsettings >/dev/null 2>&1; then
  echo "not a gnome environment"
  exit 1
fi

. $basedir/env.sh

today=`date +%Y/%m/%d`
now=`date +%H:%M:%S`
dest_file=$dest_dir/$today/$now.jpg

if [ ! -d "$dest_dir/$today" ]; then
  mkdir -p "$dest_dir/$today"
fi

background_url=$(curl -s "$api_url" -H "Authorization: Client-ID $access_token" | jq -r .urls.raw)
if [ -z "$background_url" ]; then
  echo "cannot download wallpaper"
  exit 1
fi
curl -s "$background_url" -o "$dest_file"

gsettings set org.gnome.desktop.background picture-uri "$dest_file"

