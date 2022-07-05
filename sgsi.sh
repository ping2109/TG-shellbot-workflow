#!/bin/bash

# Copyright (C) 2022 ping2109

set -a
source config.env
set +a

git config --global user.name "$GH_NAME"
git config --global user.email "$GH_MAIL"
git config --global credential.helper store
echo "https://$GH_NAME:$GH_TOKEN@github.com" > ~/.git-credentials

sudo -E apt-get -qq update
sudo -E apt-get -qq install bc build-essential zip curl libstdc++6 git wget python gcc clang libssl-dev rsync flex bison ccache expect aria2 unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev brotli liblz4-tool axel gawk aria2 detox cpio rename build-essential simg2img aria2 python3-pip tree
rm -rf /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64
sudo apt-get purge --purge openjdk* -y


REPO="https://github.com/TheRealAnh/sGSI"

git clone --recurse-submodules $REPO -b tool neva
sudo chmod -R 0777 neva ; cd neva
git clone --recurse-submodules $REPO -b 11 11
echo "en_US" > 11/.lang_flag
git clone --recurse-submodules $REPO -b 12 12
echo "en_US" > 12/.lang_flag
git clone --recurse-submodules $REPO -b 12-slim 12s
echo "en_US" > 12s/.lang_flag
git clone --recurse-submodules $REPO -b 12-lite 12l
echo "en_US" > 12l/.lang_flag
git clone --recurse-submodules $REPO -b 13 13
echo "en_US" > 13/.lang_flag
sudo chmod -R 0777 ./
sudo bash 12/setup.sh
sudo apt-get -y --purge remove "adoptopenjdk-11-hotspot"
sudo pip3 install 'protobuf~=3.19.0'

echo "NAME=ping2109" >> config.env
echo "PASS=$SF_PASS" >> config.env
