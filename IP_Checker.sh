#!/bin/bash
sudo yum -y install ipcalc 
clear
echo "Welcome to the IP_Checker.sh"
echo "Please Enter An IP Address With CIDR"
echo "Example: 192.168.1.1/24"
echo -e "[IP]>|\c"
read IP
SubnetMask=`ipcalc -m $IP`
#-----------------------------------------
#Split IPv4 Address Into Octets
octa=$(echo ${IP} | tr "." " " | awk '{ print $1 }')
octb=$(echo ${IP} | tr "." " " | awk '{ print $2 }')
octc=$(echo ${IP} | tr "." " " | awk '{ print $3 }')
octd=$(echo ${IP} | tr "." " " | awk '{ print $4 }')
#-----------------------------------------
#Class A
if [ "$octa" -ge 1 ] && [ "$octa" -le 126 ] && [ "$octb" -ge 0 ] && [ "$octb" -le 254 ] && [ "$octc" -ge 0 ] && [ "$octc" -le 254 ] && [ "$octd" -ge 0 ] && [ "$octd" -le 254 ];
then
  echo "Class A Ip Address Detected!"
#-----------------------------------------
#Loopback
elif [ "$octa" -eq 127 ] && [ "$octb" -ge 0 ] && [ "$octb" -le 254 ] && [ "$octc" -ge 0 ] && [ "$octc" -le 254 ] && [ "$octd" -ge 0 ] && [ "$octd" -le 254 ];
then
  echo "Loop Back Ip Address Detected!"
  echo "This Is Not A Suitable TCP/IP Address For Network Communication!"
#-----------------------------------------
#Class B
elif [ "$octa" -ge 128 ] && [ "$octa" -le 191 ] && [ "$octb" -ge 0 ] && [ "$octb" -le 254 ] && [ "$octc" -ge 0 ] && [ "$octc" -le 254 ] && [ "$octd" -ge 0 ] && [ "$octd" -le 254 ];
then
  echo "Class B Ip Address Detected!"
#-----------------------------------------
#Class C
elif [ "$octa" -ge 192 ] && [ "$octa" -le 223 ] && [ "$octb" -ge 0 ] && [ "$octb" -le 254 ] && [ "$octc" -ge 0 ] && [ "$octc" -le 254 ] && [ "$octd" -ge 0 ] && [ "$octd" -le 254 ];
then
  echo "Class C Ip Address Detected!"
else
  echo "Sorry i have an error! :O"
fi
echo "IP: $IP"
echo "$SubnetMask"
 
