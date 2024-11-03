#!/bin/sh

NDE_APP_NAME=bvim
NDE_APP_CONFIG=~/.config/$NDE_APP_NAME
export NDE_APP_NAME NDE_APP_CONFIG

rm -rf $NDE_APP_CONFIG && mkdir -p $NDE_APP_CONFIG

stow --restow --target=$NDE_APP_CONFIG .

alias bvim="NVIM_APPNAME=$NDE_APP_NAME nvim"
