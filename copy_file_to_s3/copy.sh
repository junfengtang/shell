#!/bin/bash

# sap备份到S3
echo -e "\033[41;33m Start Script ,producer:JUNFENG \033[0m"

# 同步data里面的数据
aws s3 sync /hana/backup/data/ s3://ydls3/sap/data/
aws s3 sync /hana/backup/data/ s3://ydls3/sap/data/ --delete
# 同步log里面的数据
aws s3 sync /hana/backup/log/ s3://ydls3/sap/log/
aws s3 sync /hana/backup/log/ s3://ydls3/sap/log/ --delete

echo -e "\033[41;33m 同步完成 \033[0m"

#每三十分钟执行脚本
#*/30 * * * * /home/junfeng_shell/copy_file_tos3.sh


