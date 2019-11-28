#!/bin/bash -e
git pull
mkdir -p ~/bashrcbk || echo "skip"
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/bashrcbk/.bash_profile_bk_$(date '+%Y%m%d%H%M')
[ -f ~/.bashrc ] && mv ~/.bashrc ~/bashrcbk/.bashrc_bk_$(date '+%Y%m%d%H%M')
cp .bash_profile ~/.bash_profile
cp .bashrc ~/.bashrc
. ~/.bashrc
