#!/bin/bash

#执行脚本两种方法：1.不带ip默认使用上一次ip  2.带ip参数 执行方法:脚本后面加ip地址如./service.sh 192.168.1.1

source userlogin.txt
echo -e "\033[41;33m Start Script ,producer:JUNFENG \033[0m"

ProjectPath="/Users/junfeng/backup/test"
#1.停止tomcat
cd ${ProjectPlatformPath}

i=1  
  
while(( i <= 100 ))  
do  
ab -n 2 -v 4 -p '/Users/junfeng/backup/test/userlogin.txt' -T 'application/x-www-form-urlencoded' 'http://xjj.comnews.cn/ds/FeedbackSave.asp'
sleep 2
done
