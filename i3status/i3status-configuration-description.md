# `i3status`配置说明

`i3status` - 为`i3bar`，`dzen2`，`xmobar`或`lemonbar`生成一个状态行    

> **格式：**     </br>
> 
> ```shell
> i3status [-c configfile] [-h] [-v]
> ```

## 描述：

`i3status`是一个小程序（大约`1500 SLOC`），用于为`i3bar`，`dzen2`，`xmobar`，`lemonbar`或类似程序生成状态栏。    
其通过发布极少数系统调用而设计为非常高效，因通常希望每秒更新一次这种状态行。    
这可确保即使在高负载情况下，状态栏亦能正确更新。    
而且，其不会像占用相应数量的`shell`命令那样占用`CPU`，而是节省一点资源。    

## 选项：

> 指定备用配置文件路径。     </br>
> 
> 默认情况下，`i3status`按如下顺序查找配置文件：    </br>

```shell
    -c      
             1.~/.config/i3status/config (or  $XDG_CONFIG_HOME/i3status/config if set)
             2./etc/xdg/i3status/config (or  $XDG_CONFIG_DIRS/i3status/config if set)
             3.~/.i3status.conf  
             4./etc/i3status.conf
```

## 配置:

`i3status`的基本思想是可指定应该使用哪些“模块”（顺序指令）。    </br>

之后可使用各自的部分配置每个模块。    </br>
对于每个模块，可指定输出格式。    </br>

### 示例配置:

```shell
Sample configuration.

general {
        output_format = "dzen2"
        colors = true
        interval = 5
}

order += "ipv6"
order += "disk /"
order += "run_watch DHCP"
order += "run_watch VPNC"
order += "path_exists VPN"
order += "wireless wlan0"
order += "ethernet eth0"
order += "battery 0"
order += "cpu_temperature 0"
order += "memory"
order += "load"
order += "tztime local"
order += "tztime berlin"

wireless wlan0 {
        format_up = "W: (%quality at %essid, %bitrate) %ip"
        format_down = "W: down"
}

ethernet eth0 {
        format_up = "E: %ip (%speed)"
        format_down = "E: down"
}

battery 0 {
        format = "%status %percentage %remaining %emptytime"
        format_down = "No battery"
        status_chr = "⚡ CHR"
        status_bat = "🔋 BAT"
        status_unk = "? UNK"
        status_full = "☻ FULL"
        path = "/sys/class/power_supply/BAT%d/uevent"
        low_threshold = 10
}

run_watch DHCP {
        pidfile = "/var/run/dhclient*.pid"
}

run_watch VPNC {
        # file containing the PID of a vpnc process
        pidfile = "/var/run/vpnc/pid"
}

path_exists VPN {
        # path exists when a VPN tunnel launched by nmcli/nm-applet is active
        path = "/proc/sys/net/ipv4/conf/tun0"
}

tztime local {
        format = "%Y-%m-%d %H:%M:%S"
        hide_if_equals_localtime = true
}

tztime berlin {
        format = "%Y-%m-%d %H:%M:%S %Z"
        timezone = "Europe/Berlin"
}

load {
        format = "%5min"
}

cpu_temperature 0 {
        format = "T: %degrees °C"
        path = "/sys/devices/platform/coretemp.0/temp1_input"
}

memory {
        format = "%used"
        threshold_degraded = "10%"
        format_degraded = "MEMORY: %free"
}

disk "/" {
        format = "%free"
}

read_file uptime {
        path = "/proc/uptime"
}
```

> **注意：**
> 
> - 若将`colors`设置为`false`，则`colors`指令将禁用所有颜色。    
> 
> - `interval`指令指定`i3status`在打印下一个状态行之前将要休眠的时间（以秒为单位）。    

## `Time`

输出当地时区的当前时间。    </br>

要使用不同的时区，可设置`TZ`环境变量，或使用`tztime`模块。    
有关格式字符串的详细信息。    
例     

```shell
order: time
```

例    

```shell
 format: %Y-%m-%d %H:%M:%S
```

## `TzTime`

输出给定时区中的当前时间。    </br>

如果没有给出时区，则使用本地时间。    
 有关格式字符串的详细信息，请参阅`strftime`(3)。    
 系统的时区数据库通常安装在`/usr/share/zoneinfo`中。    </br>

该路径下的文件使得有效的时区字符串成为可能，    </br>

> **例如：**     </br>
> 
> - 对于`/usr/share/zoneinfo/Europe/Berlin`，可在`tztime`模块中设置时区为`Europe/Berlin`。    </br>
> 
> - 要覆盖环境的区域设置，请设置区域设置选项。    

例    

```shell
 order: tztime berlin
```

例    

```shell
 format: %Y-%m-%d %H:%M:%S %Z
```

例    

```shell
 timezone: Europe/Berlin
```

例    

```shell
 locale: de_DE.UTF-8
```

> **注意：**
> 
> - 如果想在本节中使用`markup`，则会自动转义一个单独的`format_time`选项。      </br>
> 
> - 之后其输出将替换格式字符串中的`％time`。    </br>

### 示例配置(`markup`):

```shell
tztime berlin {
        format = "<span foreground='#ffffff'>time:</span> %time"
        format_time = "%H:%M %Z"
        timezone = "Europe/Berlin"
}
```

## `DDate`

以用户指定的格式输出当前的日期。    </br>

有关格式字符串的详细信息。    

> **注意：**
> 
> - 没有`%`。    </br>
> 
> - 亦没有 `%X` 。    </br>

例    

```shell
 order: ddate
```

例    

```shell
 format: %{%a, %b %d%}, %Y%N - %H
```

## `CPU Usage`

从 `/proc/stat` (Linux) 或 `sysctl`(3) (FreeBSD/OpenBSD) 获取百分比`CPU`使用率。     </br>

可定义一个`max_threshold`，以便在最后一个时间间隔内`CPU`的平均值高于配置的阈值时使负载值变为红色。    </br>

默认为`95`。    </br>
`max_threshold`的输出格式可使用`format_above_threshold`进行定制。    </br>

可定义一个`degraded_threshold`，以便在最后一个时间间隔内`CPU`的平均值高于配置的阈值时将负载值变为黄色。    </br>
默认为`90`。    </br>
可可用`format_above_degraded_threshold`定制高于降级阈值时的输出格式。    </br>
例    

```shell
 order: cpu_usage
```

例    

```shell
 format: %usage
```

例    

```shell
 max_threshold: 75
```

例    

```shell
 format_above_threshold: Warning above threshold: %usage
```

例    

```shell
 degraded_threshold: 25
```

例    

```shell
 format_above_degraded_threshold: Warning above degraded threshold: %usage
```

## `Ethernt`

获取IP地址和（如果可能）给定以太网接口的链接速度。   </br>
获得链接速度需要`cap_net_admin`功能。     </br>
使用`setcap cap_net_admin=ep $`（其中`i3status`）进行设置。    </br>
特殊接口名称`_first_`将被系统中第一个非无线网络接口（不包括以“`lo`”开头的设备）取代。    </br>
例    

```shell
 order: ethernet eth0
```

例    

```shell
 format: E: %ip (%speed)
```

## `CPU-Temperature`

获取给定热区的温度。    </br>
可定义一个`max_threshold`，以便在指定的散热区变得太热的情况下使温度变成红色。    </br>
默认为`75`摄氏度    </br>
在`max_threshold`以上时的输出格式可可用`format_above_threshold`进行定制。    </br>
例    

```shell
 order: cpu_temperature 0
```

例    

```shell
 format: T: %degrees °C
```

例    

```shell
 max_threshold: 42
```

例    

```shell
 format_above_threshold: Warning T above threshold: %degrees °C
```

例    

```shell
 path: /sys/devices/platform/coretemp.0/temp1_input
```

如果温度报告其无法读取温度数值，那修改一句：    

```shell
path = "/sys/class/thermal/thermal_zone0/temp"
```

## `Load`

获取系统负载（在最后`1`分钟，`5`分钟和`15`分钟内等待`CPU`时间的进程数量）。    
可定义一个`max_threshold`，以便在最后一分钟的负载平均值高于配置的阈值的情况下将负载值变成红色。    </br>
默认为`5`。    </br>
`max_threshold`的输出格式可可用`format_above_threshold`进行定制。    </br>
例    

```shell
 order: load
```

例    

```shell
 format: %1min %5min %15min
```

例    

```shell
 max_threshold: "0,1"
```

例    

```shell
 format_above_threshold: Warning: %1min %5min %15min
```

## 网速显示

可把示例的脚本修改来用。    </br>
这个脚本已经具有自动查找网卡的能力。    </br>
如果需要自行指定网卡：    </br>

用 `ip addr` 命令找到网卡代号，如`wlan0`    </br>
在 `/sys/devices` 路径下，用如下命令来确认网卡是存在的：    </br>

```shell
 $ find /sys/devices -name wlan0
```

把上面的脚本下载到适当的位置 (比如 `~/.config/i3`) ，把想观测的网卡代号写进去。    

> 把这个脚本改为可执行属性    

```shell
 $ chmod +x ~/.i3/config/net-speed.sh
```

修改`~/.i3/config` 中对应章节：    

```shell
 bar {
   status_command exec ~/.i3/config/net-speed.sh
 }
```