#!/bin/bash
#1033110136@qq.com
#linux 配置邮箱
#vim /etc/s-nail.rc
#set from=junfeng.tang@beforeship.com smtp=smtp.exmail.qq.com
#set smtp-auth-user=junfeng.tang@beforeship.com smtp-auth-password="your passwd" smtp-auth=login
source config.sh
echo "The old IP is:"$IPOLD
Getip=$(curl -s ip.cn?ip=$1)
IParea=$(echo $Getip|awk -F "：" '{print $3}'|awk '{print $1}')
IPisp=$(echo $Getip|awk -F "：" '{print $3}'|awk '{print $2}')
if [ ! $1	];then
IP=$(echo $Getip|awk -F "：" '{print $2}'|awk '{print $1}')
	if [[ $IP != $IPOLD ]]; then
		echo $IP $IParea $IPisp
		echo "" > config.sh
		echo "IPOLD ="$IP >> config.sh
		echo "Yundongli company IP change to"$IP|mail -s Beforeship_IP junfeng.tang@beforeship.com
	else
		echo 'The IP is same as the old one:'$IP|mail -s Beforeship_IP junfeng.tang@beforeship.com
	fi
else
echo 'Fail to get ip'|mail -s Beforeship_IP junfeng.tang@beforeship.com
echo $1 $IParea $IPisp
fi

