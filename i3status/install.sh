#!/bin/env bash

sudo cp ~/.config/i3status/config ~/.config/i3status/config.bak
sudo rm -rf ~/.config/i3status/config
sudo cp i3status.conf ~/.config/i3status
sudo mv ~/.config/i3status/i3status.conf ~/.config/i3status/config

sudo cp /etc/xdg/i3status/config /etc/xdg/i3status/config.bak
sudo rm -rf /etc/xdg/i3status/config
sudo cp i3status.conf /etc/xdg/i3status
sudo mv /etc/xdg/i3status/i3status.conf /etc/xdg/i3status/config

sudo cp ~/.i3status.conf ~/.i3status.conf.bak
sudo rm -rf ~/.i3status.conf
sudo cp i3status.conf ~/

sudo cp /etc/i3status.conf /etc/i3status.conf.bak
sudo rm -rf /etc/i3status.conf
sudo cp i3status.conf /etc
