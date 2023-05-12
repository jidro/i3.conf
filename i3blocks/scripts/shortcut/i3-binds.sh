#!/bin/bash
# i3 key binds for rofi
# poorly written by Mr Green [mrgreen@archbang.org]

gen_binds() { i3-msg -t get_config | grep bindsym | sed 's/\$ei//g;s/--no-startup-id//g;s/exec//g;s/bindsym//g;s/$mod/Super/g;s/--release/Release/g;/^#/d' ; }

#echo empty; gen_binds | rofi -dmenu -p "i3 Keyboard Shortcuts"
#echo empty; gen_binds | rofi -dmenu -p "i3 Keyboard Shortcuts" -config $HOME/.config/i3blocks/scripts/shortcut-key/config.rasi
echo empty; gen_binds | rofi -dmenu -p "i3 Keyboard Shortcuts" -no-config
