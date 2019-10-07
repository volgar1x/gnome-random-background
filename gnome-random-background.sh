#!/bin/sh

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

access_token=c63d8392be08d106366f8f9d5816bf221cf51e775cf761a10aea0dcf9da437dd
api_url=https://api.unsplash.com/photos/random

background_url=$(curl -s $api_url -H "Authorization: Client-ID $access_token" | jq -r .urls.raw)

gsettings set org.gnome.desktop.background picture-uri "$background_url"

