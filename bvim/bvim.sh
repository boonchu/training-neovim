#!/usr/bin/sh

NDE_APP_NAME=bvim
alias bvim="NVIM_APPNAME=$NDE_APP_NAME nvim"
bvim $*
