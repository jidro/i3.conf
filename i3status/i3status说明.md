# i3status说明

> i3status - 为i3bar，dzen2，xmobar或lemonbar生成一个状态行    
格式: i3status [-c configfile] [-h] [-v]    

## 描述：
> i3status是一个小程序（大约1500 SLOC），用于为i3bar，dzen2，xmobar，lemonbar或类似程序生成状态栏。    
它通过发布极少数系统调用而设计为非常高效，因为人们通常希望每秒更新一次这种状态行。    
这可确保即使在高负载情况下，状态栏也能正确更新。    
而且，它不会像占用相应数量的shell命令那样占用CPU，而是节省一点资源。    

## 选项：

```
    -c      指定备用配置文件路径。 默认情况下，i3status按以下顺序查找配置文件：
             1.~/.config/i3status/config (or  $XDG_CONFIG_HOME/i3status/config if set)
             2./etc/xdg/i3status/config (or  $XDG_CONFIG_DIRS/i3status/config if set)
             3.~/.i3status.conf  
             4./etc/i3status.conf
```

## 配置:
> i3status的基本思想是可以指定应该使用哪些“模块”（顺序指令）。然后可以使用各自的部分配置每个模块。    
对于每个模块，您可以指定输出格式.    

### 示例配置:

```
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

> 如果将colors设置为false，colors指令将禁用所有颜色。    
interval指令指定i3status在打印下一个状态行之前将要休眠的时间（以秒为单位）。    

## Time
> 输出当地时区的当前时间。要使用不同的时区，可以设置TZ环境变量，或使用tztime模块。    
有关格式字符串的详细信息。    
例     
```
order: time
```
例    
```
 format: %Y-%m-%d %H:%M:%S
```

## TzTime
>输出给定时区中的当前时间。如果没有给出时区，则使用本地时间。    
 有关格式字符串的详细信息，请参阅strftime(3)。    
 系统的时区数据库通常安装在/usr/share/zoneinfo中。该路径下的文件使得有效的时区字符串成为可能，    
 例如 对于/usr/share/zoneinfo/Europe/Berlin，您可以在tztime模块中设置时区为Europe/Berlin。    
 要覆盖您的环境的区域设置，请设置区域设置选项。    
例    
```
 order: tztime berlin
```
例    
```
 format: %Y-%m-%d %H:%M:%S %Z
```
例    
```
 timezone: Europe/Berlin
```
例    
```
 locale: de_DE.UTF-8
```
如果您想在本节中使用markup，则会自动转义一个单独的format_time选项。    
然后它的输出将替换格式字符串中的％time。    

### 示例配置(markup):

```
tztime berlin {
        format = "<span foreground='#ffffff'>time:</span> %time"
        format_time = "%H:%M %Z"
        timezone = "Europe/Berlin"
}
```

## DDate
> 以用户指定的格式输出当前的日期。有关格式字符串的详细信息。    
**注意：没有%. 也没有 %X 。**    
例    
```
 order: ddate
```
例    
```
 format: %{%a, %b %d%}, %Y%N - %H
```

## CPU Usage
> 从 /proc/stat (Linux) 或 sysctl(3) (FreeBSD/OpenBSD) 获取百分比CPU使用率。

> 可以定义一个max_threshold，以便在最后一个时间间隔内CPU的平均值高于配置的阈值时使负载值变为红色。默认为95。    
max_threshold的输出格式可以使用format_above_threshold进行定制。    

> 可以定义一个degraded_threshold，以便在最后一个时间间隔内CPU的平均值高于配置的阈值时将负载值变为黄色。    
默认为90。    
可以使用format_above_degraded_threshold定制高于降级阈值时的输出格式。    
例    
```
 order: cpu_usage
```
例    
```
 format: %usage
```
例    
```
 max_threshold: 75
```
例    
```
 format_above_threshold: Warning above threshold: %usage
```
例    
```
 degraded_threshold: 25
```
例    
```
 format_above_degraded_threshold: Warning above degraded threshold: %usage
```

## Ethernt
> 获取IP地址和（如果可能）给定以太网接口的链接速度。   
获得链接速度需要cap_net_admin功能。     
使用setcap cap_net_admin=ep $（其中i3status）进行设置。    
特殊接口名称_first_将被系统中第一个非无线网络接口（不包括以“lo”开头的设备）取代。    
例    
```
 order: ethernet eth0
```
例    
```
 format: E: %ip (%speed)
```

## CPU-Temperature
> 获取给定热区的温度。    
可以定义一个max_threshold，以便在指定的散热区变得太热的情况下使温度变成红色。    
默认为75摄氏度    
在max_threshold以上时的输出格式可以使用format_above_threshold进行定制。    
例    
```
 order: cpu_temperature 0
```
例    
```
 format: T: %degrees °C
```
例    
```
 max_threshold: 42
```
例    
```
 format_above_threshold: Warning T above threshold: %degrees °C
```
例    
```
 path: /sys/devices/platform/coretemp.0/temp1_input
```
如果温度报告它无法读取温度数值，那修改一句：    
```
path = "/sys/class/thermal/thermal_zone0/temp"
```

## Load
> 获取系统负载（在最后1分钟，5分钟和15分钟内等待CPU时间的进程数量）。    
可以定义一个max_threshold，以便在最后一分钟的负载平均值高于配置的阈值的情况下将负载值变成红色。    
默认为5。    
max_threshold的输出格式可以使用format_above_threshold进行定制。    
例    
```
 order: load
```
例    
```
 format: %1min %5min %15min
```
例    
```
 max_threshold: "0,1"
```
例    
```
 format_above_threshold: Warning: %1min %5min %15min
```

## 网速显示
> 可以把示例的脚本修改来用。    
这个脚本已经具有自动查找网卡的能力。    
如果需要自行指定网卡：    

> 用 ip addr 命令找到你的网卡代号，如wlan0    
在 /sys/devices 路径下，用如下命令来确认网卡是存在的:    
```
 $ find /sys/devices -name wlan0
```
把上面的脚本下载到适当的位置 (比如 ~/.config/i3) ，把你想观测的网卡代号写进去。    

> 把这个脚本改为可执行属性    
```
 $ chmod +x ~/.i3/config/net-speed.sh
```
修改~/.i3/config 中对应章节：    
```
 bar {
   status_command exec ~/.i3/config/net-speed.sh
 }
```