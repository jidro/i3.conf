#!/bin/env bash

cp -rfpv ~/.config/i3status/config ~/.config/i3status/config.bak
rm -rfv ~/.config/i3status/config
cp -rfpv i3status.conf ~/.config/i3status
mv -v ~/.config/i3status/i3status.conf ~/.config/i3status/config

sudo cp -rfpv /etc/xdg/i3status/config /etc/xdg/i3status/config.bak
sudo rm -rfv /etc/xdg/i3status/config
sudo cp -rfpv i3status.conf /etc/xdg/i3status
sudo mv -v /etc/xdg/i3status/i3status.conf /etc/xdg/i3status/config

cp -rfpv ~/.i3status.conf ~/.i3status.conf.bak
rm -rfv ~/.i3status.conf
cp -rfpv i3status.conf ~/

sudo cp -rfpv /etc/i3status.conf /etc/i3status.conf.bak
sudo rm -rfv /etc/i3status.conf
sudo cp -rfpv i3status.conf /etc
