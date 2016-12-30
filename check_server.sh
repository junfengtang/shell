#!/bin/bash
Resettem=$(tput sgr0)
Nginxserver='http://touchsky.net/nginx_status'
Check_Nginx_Server()
{
Status_Code=$(curl -m 5 -s -w %{http_code} ${Nginxserver} -o /dev/null)
if [ $Status_Code -eq 000 -o $Status_Code -ge 500 ]
then
echo -e '\E[32m' "Check http server error! Response status code is" $Resettem $Status_code
else
Http_content=$(curl -s ${Nginxserver})
echo -e '\E[32m' "Check http server ok! \n" $Resettem $Http_content
fi
}