# 网速显示

可以将的示例脚本修改来用。    </br>
这个脚本已经具有自动查找网卡的能力。    </br>
如果需要自行指定网卡：    </br>

用 `ip addr` 命令找到网卡代号，如`wlan0`    </br>
在 `/sys/devices` 路径下，用如下命令来确认网卡是存在的：    </br>

```shell
 $ find /sys/devices -name wlan0
```

将上面的脚本下载到适当的位置 (比如 `~/.config/i3`) ，    </br>

将想观测的网卡代号写进去。    </br>

> 将该脚本改为可执行属性    

```shell
 $ chmod +x ~/.i3/config/net-speed.sh
```

修改`~/.i3/config` 中对应章节：    </br>

```shell
 bar {
   status_command exec ~/.i3/config/net-speed.sh
 }
```