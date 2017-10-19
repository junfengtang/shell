#!/bin/bash　　
#show databases
HOSTNAME="127.0.0.1"                                         
PORT="3306"
USERNAME="root"
PASSWORD="bike.com"

DBNAME="oceanmin"                                                      
TABLENAME="ocean_admin"    

show_db="show databases" 

echo -e "\033[33mshow database:\033[0m"
mysql -h ${HOSTNAME} -u ${USERNAME} -p${PASSWORD} -e "${show_db}"  

                            