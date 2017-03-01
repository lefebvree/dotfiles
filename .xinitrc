#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Herbstluftwm
exec herbstluftwm


