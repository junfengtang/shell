#!/bin/bash
clear
if [[ $# -eq 0 ]]
#判断位置参数的个数是否为0
then
reset_terminal=$(tput sgr0)
#设置变量，每次调用它都会使屏幕的输出恢复正常
#Check OS Type
os=$(uname -o)
echo -e '\E[36m'"Operating System Type: " $reset_terminal $os
#Check OS Release Version and Name
os_name=$(cat /etc/issue)
echo -e '\E[36m'"Check OS Release Version and Name: " $reset_terminal $os_name
#Check Architecture
architecture=$(uname -m)
echo -e '\E[36m'"Check Architecture: " $reset_terminal $architecture
#Check Kernel Release
kernerrelease=$(uname -r)
echo -e '\E[36m'"Check Kernel Release: " $reset_terminal $kernerrelease
#Check Hostname
hostname=$(uname -n)
echo -e '\E[36m'"Check Hostname: " $reset_terminal $hostname
#或者 echo $(HOSTNAME)
#Check Internal IP
internalip=$(hostname -I)
echo -e '\E[36m'"Check Internal IP: " $reset_terminal $internalip
#Check External IP
externalip=$(curl -s http://ipecho.net/plain)
echo -e '\E[36m'"Check External IP: " $reset_terminal $externalip
#通过curl命令发出网络请求，返回自己的公网IP
#输出到空设备回收站中，不显示任何输出
#Check Logged In Users
who>/tmp/who
echo -e '\E[36m' "Logged In Users" $reset_terminal && cat /tmp/who 
rm -f /tmp/who
fi
