#!/bin/bash

#对比两台服务器目录缺失文件，并完成拷贝 
echo -e "\033[41;33m Start Script ,producer:JUNFENG \033[0m"

#脚本在缺少文件的服务器pro执行

#上uat服务器获取ProductImage下面所有的文件夹
#ls > uat.txt  将次文件拷贝到pro服务器/home/ubuntu/junfeng_shell上

#登录两台服务器获取ProductImage下面所有文件
ls /home/source/test/ProductImage >/home/ubuntu/junfeng_shell/pro.txt

#对比两个文件，找出pro.txt里面没有而pro.txt里面有的内容；并输出到temp.txt
grep -vwf  pro.txt uat.txt > /home/ubuntu/junfeng_shell/temp.txt
sleep 3

#逐行读取temp.txt内容，然后执行拷贝
while read line
do
    echo $line    
    scp -i test03.pem -r ubuntu@192.168.1.1:/home/source/test/ProductImage/$line /home/source/test/ProductImage
	sleep 3
done < /home/ubuntu/junfeng_shell/temp.txt

#注意：1.scp需要秘钥，提前在服务器目录准备秘钥 
#     2.提前准备uat.txt文件到pro服务器



