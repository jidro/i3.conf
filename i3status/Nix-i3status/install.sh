#!/bin/env bash

# Firstly, the default i3status configuration file is in the $HOME/.config/i3status/ folder, 
# and its configuration file name is config.
# This section is to rename the original configuration file 
# and copy the configuration file in the repository. End
mkdir -pv $HOME/.config/i3status/
cp -rfpv $HOME/.config/i3status/config $HOME/.config/i3status/config.bak
rm -rfv $HOME/.config/i3status/config
cp -rfpv i3status/* $HOME/.config/i3status
mv -v ~/.config/i3status/i3status.conf $HOME/.config/i3status/config

# Secondly, if the configuration file for i3status is not in the $HOME/.config/i3status folder, 
# it may be in the $HOME folder, and it is a hidden file with the approximate name .i3status.conf. 
# This section is a one click installation based on the i3status configuration file in the $HOME folder, 
# which is a hidden file named .i3status.conf.
# However, it should be noted that this paragraph is commented, 
# which means that it will not run automatically and can only be run after the comment is cancelled. 
# If the installation fails with one click, 
# then comment out the previous paragraph, 
# remove the comment from this paragraph, and try again.
#cp -rfpv $HOME/.i3status.conf $HOME/.i3status.conf.bak
#rm -rfv $HOME/.i3status.conf
#cp -rfpv i3status/config $HOME/.i3status.conf

# Once again, if the configuration file for i3status is 
# not in the $HOME/.config/i3status folder or in the $HOME folder, 
# you can only use sudo for authorization and directly modify the configuration file in the /etc folder. 
# The exact location is also uncertain, possibly in the /etc/xdg/i3status folder, 
# and the configuration file name is config. 
# This section is a one click installation based on the i3status configuration file 
# in the/etc/xdg/i3status folder, named config.
# However, it should be noted that this section is commented out, 
# which means that it will not run automatically and can only be run after the comment is cancelled. 
# If the installation fails with one click, then comment out the previous sections, 
# remove the comments from this section, and try again.
#sudo cp -rfpv /etc/xdg/i3status/config /etc/xdg/i3status/config.bak
#sudo rm -rfv /etc/xdg/i3status/config
#sudo cp -rfpv i3status/* /etc/xdg/i3status
#sudo mv -v /etc/xdg/i3status/i3status.conf /etc/xdg/i3status/config

# Finally, if the configuration file for i3status is not in the $HOME/.config/i3status folder, 
# nor in the $HOME folder, nor in the/etc/xdg/i3status folder, 
# it is also possible to use sudo permissions to modify the i3status.conf file 
# in the /etc folder, but only here. 
# This section is a one-click installation based on the i3status configuration file in the /etc folder 
# and named i3status.
# However, it should be noted that this section is commented out, 
# which means that it will not run automatically and can only be run after the comment is cancelled. 
# If the installation fails with one click, then comment out the previous sections, 
# remove the comments from this section, and try again.
#sudo cp -rfpv /etc/i3status.conf /etc/i3status.conf.bak
#sudo rm -rf /etc/i3status.conf
#sudo cp -rfpv i3status/* /etc/

# If you can avoid using the method of lifting permissions, it is better not to use it as much as possible. 
# After all, it is slightly safer to use the $HOME folder. 
# If you lift permissions, you may inadvertently modify system files, 
# resulting in system instability or system crash.
