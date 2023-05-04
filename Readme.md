# [`i3.conf`](https://github.com/jidro/i3.conf)

## 中文说明：

[`i3`](https://i3wm.org/) 是一种动态的[平铺式窗口管理器](https://en.wikipedia.org/wiki/Tiling_window_manager "wikipedia:Tiling window manager")，其灵感来自于面向开发者与资深用户的 `wmii`。

*`i3`* 的既定目标包括清晰可读的文档，完善的多显示器支持，基于树形结构的窗口管理，提供 [`vim`](https://wiki.archlinuxcn.org/wiki/Vim "Vim") 式的多种操作模式。

`i3status` - 为`i3bar`、`dzen2`、`xmobar`或`lemonbar`生成状态栏。

### 文件说明：

- [`config`](https://github.com/jidro/i3.conf/tree/master/config "config")文件夹 - 为`i3wm`的配置文件，提取自`$HOME/.config/i3/`文件夹。
  
- [`i3status`](https://github.com/jidro/i3.conf/tree/master/i3status "i3status")文件夹 - 为`i3status`的配置文件，提取自`$HOME/.config/i3status`文件夹。

- [`i3blocks`](https://github.com/jidro/i3.conf/tree/master/i3blocks "i3blocks")文件夹 - 为`i3status`（`i3wm`状态栏）平替`i3blocks`（可通过`shell`脚本扩展的`i3wm`状态栏）的配置文件，提取自`$HOME/.config/i3blocks`文件夹。

### 如何使用：

#### `i3wm config`：

- ① 将该仓库克隆到本地。
  
- ② 使用`cd`命令进入本仓库的`config/i3`文件夹。
  
- ③ 将`config`文件复制到`$HOME/.config/i3`文件夹。
  
  > **注意：**
  > 
  > 一定要备份好原文件，
  > 
  > 复制到相应的配置文件夹后可能会覆盖，想要还原会有一定难度。
  
- ④ 退出`i3wm`窗口管理器重新进入（或者，重启电脑）。
  
- ⑤ 尽情享受吧~
  

#### `i3status`：

- ① 将该仓库克隆到本地。
  
- ② 使用`cd`命令进入本仓库的`i3status`文件夹。
  
- ③ 将`i3status`文件夹内的文件复制到`$HOME/.config/i3status`文件夹。
  
  > **注意：**
  > 
  > 配置文件不一定在`$HOME/.config/i3status`文件夹，也可能在其他地方。
  > 
  > 请确保已经知到配置文件的位置，并将该仓库内配置文件复制到相应位置。
  > 
  > 一定要备份好原文件，
  > 
  > 复制到相应的配置文件夹后可能会覆盖，想要还原会有一定难度。
  > 
  > > `i3status`配置文件可能存在的位置如下：
  > > 
  > > 1、`~/.config/i3status/config` (或者，若设置了，则会在 `$XDG_CONFIG_HOME/i3status/config`)
  > > 
  > > 2、`/etc/xdg/i3status/config` (或者，若设置了，则会在 `$XDG_CONFIG_DIRS/i3status/config` )
  > > 
  > > 3、`~/.i3status.conf`
  > > 
  > > 4、`/etc/i3status.conf`
  > 
  > 亦可使用本仓库的`install.sh`脚本进行一键安装。
  > 
  > 但，脚本内默认只会将配置文件复制到`$HOME/.config/i3status`文件夹，
  > 
  > 若想复制到其他位置，请根据脚本内介绍自行修改。
  
- ④ 退出`i3wm`窗口管理器重新进入（或者，重启电脑）。
  
- ⑤ 尽情享受吧~
  
  #### `i3blocks`：

- ① 将该仓库克隆到本地。
  
- ② 使用`cd`命令进入本仓库的`i3block`文件夹。
  
- ③ 将`config`文件与[`scripts`](https://github.com/jidro/i3.conf/tree/master/i3blocks/scripts)文件夹复制到`$HOME/.config/i3block`文件夹。
  
  > **注意：**
  > 
  > 一定要备份好原文件，
  > 
  > 复制到相应的配置文件夹后可能会覆盖，想要还原会有一定难度。
  
- ④ 退出`i3wm`窗口管理器重新进入（或者，重启电脑）。
  
- ⑤ 尽情享受吧~
  
### 免责声明：

此为本人学习使用。

由此提供对您的网站或计算机造成严重后果的本站概不负责。

此为纯属个人学习使用，禁止任何机构及个人将此系统作为商业用途！

禁止修改并盗用他人名义在网上传播！

请在体验试用24小时之内删除销毁！

若同意以上条款，方可对此进行下载使用！

若已下载此中任何，即视为同意以上条款！

若有侵犯行为，请联系本人删除。

此仅为个人学习测试使用，请在下载后24小时内删除，不得用于任何商业用途，

否则后果自负！

## English Description ：

[`i3`](https://i3wm.org/) is a dynamic [tiling window manager](https://en.wikipedia.org/wiki/Tiling_window_manager "wikipedia:Tiling window manager") inspired by `wmii` that is primarily targeted at developers and advanced users.

The stated goals for *`i3`* include clear documentation, proper multi-monitor support, a tree structure for windows, and different modes like in [`vim`](https://wiki.archlinux.org/title/Vim "Vim").

`i3status` - Generates a status line for `i3bar`, `dzen2`, `xmobar` or `lemonbar`.

### Document description：

- [`config`](https://github.com/jidro/i3.conf/tree/master/config "config")folder - The configuration file for `i3wm` is extracted from the `$HOME/.config/i3/` folder.
  
- [`i3status`](https://github.com/jidro/i3.conf/tree/master/i3status "i3status")folder - The configuration file for `i3status` is extracted from the `$HOME/.config/i3status` folder.
  
- [`i3blocks`](https://github.com/jidro/i3.conf/tree/master/i3blocks "i3blocks")folder - Displace the configuration file for `i3blocks` (the `i3wm` status bar that can be extended by a shell script) from the `$HOME/.config/i3blocks` folder.  

### How to use：

#### `i3wm config`：

- ① Clone the warehouse locally.
  
- ② Use the `cd` command to enter the `config/i3` folder of this warehouse.
  
- ③ Copy the `config` file to the `$HOME/.config/i3` folder.
  
  > **be careful：**
  > 
  > Be sure to back up the original file,
  > 
  > After copying to the corresponding configuration folder,
  > 
  > it may be overwritten, making it difficult to restore.
  
- ④ Exit the `i3wm` window manager and re-enter (or, restart the computer).
  
- ⑤ Enjoy it~
  

#### `i3status`：

- ① Clone the warehouse locally.
  
- ② Use the `cd` command to enter the `i3status` folder of this warehouse.
  
- ③ Copy the files in the `i3status` folder to the `$HOME/.config/i3status` folder.
  
  > **Pay Attention To：**
  > 
  > The configuration file may not be located in the `$HOME/.config/i3status` folder, but may also be located elsewhere.
  > 
  > Please ensure that the location of the configuration file is known and copy the configuration file in the warehouse to the appropriate location.
  > 
  > Be sure to back up the original file,
  > 
  > After copying to the corresponding configuration folder, it may be overwritten, making it difficult to restore.
  > 
  > > The possible locations of the `i3status` configuration file are as follows:
  > > 
  > > 1、`~/.config/i3status/config` (or `$XDG_CONFIG_HOME/i3status/config` if set)
  > > 
  > > 2、`/etc/xdg/i3status/config` (or `$XDG_CONFIG_DIRS/i3status/config` if set)
  > > 
  > > 3、`~/.i3status.conf`
  > > 
  > > 4、`/etc/i3status.conf`
  > 
  > You can also use the `install. sh` script from this repository for one click installation.
  > 
  > However, by default, the script only copies the configuration file to the `$HOME/.config/i3status` folder,
  > 
  > If you want to copy to another location, please modify it according to the instructions in the script.
  
- ④ Exit the `i3wm` window manager and re-enter (or, restart the computer).
  
- ⑤ Enjoy it~
  
#### `i3blocks`：

- ① Clone the repository locally。
  
- ② Use the `cd` command to enter the `i3block` folder in this repository。
  
- ③ Copy the config file and [`scripts`](https://github.com/jidro/i3.conf/tree/master/i3blocks/scripts) folder to the '$HOME/.config/i3block' folder.
  
  > **Attention：**
  > 
  > Be sure to back up the original file,
  > 
  > After copying to the corresponding configuration folder,
  > 
  > it may be overwritten.
  > 
  > It is difficult to restore.
  
- ④ Exit the `i3wm` window manager and enter again （or, restart the computer）。
  
- ⑤ Enjoy it ~

### Disclaimer：

This is for my study and use.

This website is not responsible for any serious consequences caused to your website or computer by this provision.

This is purely for personal learning and use.

Any institution or individual is prohibited from using this system for commercial purposes!

It is prohibited to modify and embezzle the name of others for online dissemination!

Please delete and destroy within 24 hours of the trial!

If you agree to the above terms, you can download and use this!

If you have downloaded any of these, you will be deemed to agree to the above terms!

If there is an infringement, please contact me to delete it.

This is for personal learning testing purposes only.

Please delete it within 24 hours after downloading, and it cannot be used for any commercial purposes,

Otherwise, you will bear the consequences!
