# 网速显示

> 可以把的示例脚本修改来用。    
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