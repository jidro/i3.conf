# `i3status`

------

## 中文说明：

该文件夹内为本人正在使用的`i3wm`窗口管理器状态栏配置文件，    </br>

> 其中包括，    </br>
> 
> - 时间    </br>
> 
> - 日期    </br>
> 
> - `CPU`使用率    </br>
> 
> - `CPU`热度值    </br>
> 
> - 有线/无线网连接情况    </br>
> 
> - 系统负载情况    </br>
> 
> - [网速显示](./i3status-netspeed/net-speed-Readme.md)    </br>

`i3status`的配置路径不确定，大致会在如下位置：

```shell
1.~/.config/i3status/config (or  $XDG_CONFIG_HOME/i3status/config if set)
2./etc/xdg/i3status/config (or  $XDG_CONFIG_DIRS/i3status/config if set)
3.~/.i3status.conf  
4./etc/i3status.conf
```

### 文件说明：

该仓库中的其他两个文件夹分别为：

- `i3status-netspeed`：`i3status`网速测试脚本，可使用该脚本进行网速实时显示。

- `i3status`：`i3status`的配置文件，修改`i3status`配置即修改该文件夹内的文件。
  
  - `i3status`/`config`文件：为正在使用的修改过的`i3status`的配置文件。
  
  - `i3status`/`config.default`文件：为`i3status`的原始配置文件。

若希望自行配置`i3status`，可移步[`i3status`配置说明](./i3status-configuration-description.md)或[官方配置说明](https://i3wm.org/docs/i3status.html)进行学习配置。

若喜欢该仓库内的配置，请将配置文件替换为该仓库内的配置文件并重新启动`i3wm`，即可完成配置。

------

若对本仓库有任何建议或意见，请提出后复议。

感谢对本仓库的喜欢。

------

## English description：

This warehouse is the `i3wm` window manager status bar configuration file I am using    </br>

> These include     </br>
> 
> - Time    </br>
> 
> - Date    </br>
> 
> - CPU usage    </br>
> 
> - CPU heat value    </br>
> 
> - Wired/wireless network connection    </br>
> 
> - System load    </br>
> 
> - [Network speed display](./i3status-netspeed/net-speed-Readme.md)    </br>

The configuration path of `i3status` is uncertain, and it will be roughly located as follows：    </br> 

```shell
1.~/.config/i3status/config (or  $XDG_CONFIG_HOME/i3status/config if set)
2./etc/xdg/i3status/config (or  $XDG_CONFIG_DIRS/i3status/config if set)
3.~/.i3status.conf  
4./etc/i3status.conf
```

### filespec：

The other two folders in the warehouse are:    </br>

- `I3status netspeed `： ` i3status ` Network speed test script, which can be used to display the network speed in real time.    </br>

- `Nix-i3status`： To modify the `i3status` configuration is to modify the files in the folder.   </br>
  
  - `i3status`/`config` file ： This is a modified `i3status` configuration file that is in use.
  
  - `i3status`/`config.default` file ： The original configuration file for `i3status`.

If you want to configure `i3status` yourself, you can go to [`i3status` Configuration Instructions](./i3status-configuration-description.md) or [Official Configuration Instructions](https://i3wm.org/docs/i3status.html) to learn and configure.
If you like the configuration in the warehouse, please replace the configuration file with the configuration file in the warehouse and restart `i3wm` to complete the configuration.

------

If you have any suggestions or comments on the warehouse, please put forward them for reconsideration.
Thank you for liking our warehouse.

------

This is the end.    </br>
That's all.    </br>
