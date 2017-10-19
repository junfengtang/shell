#!/bin/bash

#执行脚本两种方法：1.不带ip默认使用上一次ip  2.带ip参数 执行方法:脚本后面加ip地址如./service.sh 192.168.1.1

echo -e "\033[41;33m Start Script ,producer:JUNFENG \033[0m"

ProjectPath="/ydl/hybris/"
ProjectPlatformPath="/ydl/hybris/bin/platform"
ProjectCustomPath="/ydl/hybris/bin/custom"
GitCodePath="/gittest/hybris/"

#1.停止tomcat
cd ${ProjectPlatformPath}
./hybrisserver.sh stop
echo -e "\033[41;33m =================停止服务OK!================= \033[0m"
sleep 10

#2.设置远程仓库ip和拉取代码
cd ${GitCodePath}
#判断是否输入新ip，输入了新ip则重新设置远程仓库地址
if [ ! -n "$1" ] ;then  
    echo -e "\033[41;33m use the unchange ip! \033[0m"  
else  
    echo -e "\033[41;33m your input ip is $1 \033[0m"  
    git remote set-url origin http://giter:password@$1:8099/hybris/hybris.git 
    echo -e "\033[41;33m =================设置远程仓库OK================= \033[0m"
fi  
sleep 10

git pull origin uat

echo -e "\033[41;33m =================拉取代码OK!================= \033[0m"
sleep 10

#3.删除旧代码，将新代码copy到项目目录下
rm -rf ${ProjectCustomPath}
cp -r ${GitCodePath}"bin/custom/" ${ProjectPath}"bin/"
echo -e "\033[41;33m =================copy代码OK!================= \033[0m"
sleep 10

#4.设置ant环境变量，编译hybris
cd ${ProjectPlatformPath}
. ./setantenv.sh 
ant customize
sleep 10
ant clean all
echo -e "\033[41;33m =================编译完成===================== \033[0m"
sleep 10

#5.启动hybris服务
./hybrisserver.sh start
echo -e "\033[41;33m =================执行完成===================== \033[0m"

