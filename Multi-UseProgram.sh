#!/bin/bash
#====================================================================="
# Regular Colors
R='\e[0;31m'          # Red
G='\e[0;32m'        # Green
Y='\e[0;33m'       # Yellow
B='\e[0;34m'         # Blue
P='\e[0;35m'       # Purple
C='\e[0;36m'         # Cyan
W='\e[0;37m'        # White
X='\e[0m'       # Text Reset
#===================================================================="
clear

function pause(){
  local message="$@"
  [ -z $message ] && message=$(echo -e ""$Y"Press "$C"["$X""$R"Enter"$X""$C"]"$X" "$Y"Key To Continue..."$X"")
  read -p "$message" readEnterKey
}

echo -e "$C""Welcome To The Multi-Use Program""$X"
FLAG=0
until [ $FLAG -eq 1 ]; 
do
  FLAG_A=0
  FLAG_B=0
  FLAG_C=0
  FLAG_D=0
  echo ""
  echo -e "$P""What Would You Like To Do?""$X"
  echo '--------------------'
  echo '[1] = Show process list of all running processes'
  echo '[2] = Show service list of all services'
  echo '[3] = Show total number of partitions in a disk'
  echo '[4] = Show the list of users present in your system'
  echo -e "$R"'[5] = Quit Program'"$X"
  echo '--------------------'
  echo
  echo -e ">| \c"
  read Ans1

if [ $Ans1 -eq 1 ];
then
  echo -e "$G""Showing process list of all running processes""$X";sleep 3s
  echo -e "$R""Press 'q' When You Are Done Looking At The List""$X";sleep 2s
  ps aux |less 
  echo -e "$C""Welcome Back :D""$X"
    until [ $FLAG_A -eq 1 ];
    do
      echo -e "$P""Would You Like To Kill A Proccess ID [PID]?""$X"
      echo 
      echo -e "[y/n]>| \c"
      read ChoiceA
	if [ $ChoiceA == 'y' ]; 
	then
	  echo -e "$P""What [PID] Would You Like To""$X""$R"" Murder?""$X"
	  echo
	  echo -e "[pid]>| \c"
	  read PID
	  echo -e "$R""Killing PID: $PID""$X";sleep 1s
	  kill $PID
	  echo -e "$G""PID: $PID Has Been Terminated :D""$X"
	  echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
	  read -p ""
	  echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_A=1
	elif [ $ChoiceA == 'n' ]; 
	then
	  echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_A=1
	else
	  echo -e "$R""Invalid Choice""$X";sleep 1s
	  FLAG_A=0
	fi
    done
  FLAG=0
elif [ $Ans1 -eq 2 ]; 
then
  echo -e "$G""Showing service list of all services""$X";sleep 3s
  service --status-all
  echo -e "$G"'---------------END_LIST'"$X"
    until [ $FLAG_B -eq 1 ];
    do
      echo -e "$P""What Would You Like To Do?""$X"
      echo 
      echo -e "$C"'[1] = Filter Running Services'"$X"
      echo -e "$C"'[2] = Filter Stopped Services'"$X"
      echo -e "$R"'[3] = Return To Main Menu'"$X"
      echo
      echo -e ">| \c"
      read ChoiceB
	if [ $ChoiceB -eq 1 ]; 
	then
	  echo -e "$G""Filtering Running Services""$X";sleep 3s
	  service --status-all |grep running
	  echo -e "$G"'---------------END_LIST'"$X"
	  echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
	  read -p ""
	  #echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_B=0
	elif [ $ChoiceB -eq 2 ]; 
	then
	  echo -e "$G""Filtering Stopped Services""$X";sleep 3s
	  service --status-all |grep stopped
	  echo -e "$G"'---------------END_LIST'"$X"
	  echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
	  read -p ""
	  #echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_B=0
	elif [ $ChoiceB -eq 3 ]; 
	then
	  echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_B=1
	else
	  echo -e "$R""Invalid Choice""$X";sleep 1s
	  FLAG_B=0	
	fi      
    done
  FLAG=0
elif [ $Ans1 -eq 3 ]; 
then
  echo -e "$G""Showing total number of partitions in a disk""$X";sleep 1s
    until [ $FLAG_C -eq 1 ];
    do
      echo -e "$P""What Would You Like To Do?""$X"
      echo 
      echo -e "$C"'[1] = List All Block Devices'"$X"
      echo -e "$C"'[2] = List All Linux Partitions'"$X"
      echo -e "$R"'[3] = Return To Main Menu'"$X"
      echo
      echo -e ">| \c"
      read ChoiceC
	if [ $ChoiceC -eq 1 ]; 
	then
	  echo -e "$G""Displaying All Block Devices""$X";sleep 3s
	  lsblk
	  echo -e "$G"'---------------END_LIST'"$X"
	  echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
	  read -p ""
	  #echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_C=0
	elif [ $ChoiceC -eq 2 ]; 
	then
	  echo -e "$G""Displaying All Linux Partitions""$X";sleep 3s
	  sudo fdisk -l
	  echo -e "$G"'---------------END_LIST'"$X"
	  echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
	  read -p ""
	  #echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_C=0
	elif [ $ChoiceC -eq 3 ]; 
	then
	  echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_C=1
	else
	  echo -e "$R""Invalid Choice""$X";sleep 1s
	  FLAG_C=0	
	fi      
    done  
  FLAG=0
elif [ $Ans1 -eq 4 ]; 
then
  echo -e "$G""Showing the list of users present in your system""$X";sleep 1s
    until [ $FLAG_D -eq 1 ];
    do
      echo -e "$P""What Would You Like To Do?""$X"
      echo 
      echo -e "$C"'[1] = List Users Logged Into This System'"$X"
      echo -e "$C"'[2] = List All Users'"$X"
      echo -e "$R"'[3] = Return To Main Menu'"$X"
      echo
      echo -e ">| \c"
      read ChoiceD
	if [ $ChoiceD -eq 1 ]; 
	then
	  echo -e "$G""Displaying All Users Logged Into This System""$X";sleep 3s
	  who
	  echo -e "$G"'---------------END_LIST'"$X"
	  echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
	  read -p ""
	  #echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_D=0
	elif [ $ChoiceD -eq 2 ]; 
	then
	  echo -e "$G""Displaying All Users""$X";sleep 3s
	  cut -d: -f1 /etc/passwd
	  echo -e "$G"'---------------END_LIST'"$X"
	  echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
	  read -p ""
	  #echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_D=0
	elif [ $ChoiceD -eq 3 ]; 
	then
	  echo -e "$G""Returning To Main Menu""$X";sleep 1s
	  FLAG_D=1
	else
	  echo -e "$R""Invalid Choice""$X";sleep 1s
	  FLAG_D=0	
	fi      
    done
  FLAG=0
elif [ $Ans1 -eq 5 ]; 
then
  echo -e "$R""Exiting Program""$X";sleep 1s
  pause
  exit
  FLAG=1
else
  echo -e "$Red""Sorry, Wrong Input""$X"
  echo "Let's Try Again...";sleep 3s
  FLAG=0
fi
done