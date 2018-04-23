#!/bin/sh

#from log to find suspicious IP
#find .| xargs grep -ri "122.112.213.180" -l

suspiciousIp=122.112.213.180

#查找文件夹下所有包含suspiciousIp的文件，并输出到ip.txt
find .| xargs grep -ri ${suspiciousIp} -l>ip.txt
#将./删除
sed -i "s/.\///g" ip.txt

#循环txt文件的文件名，然后拷贝到服务器指定位置
while read line
do
      cp $line /home/ubuntu/junfeng_shell/file/
done < ip.txt

