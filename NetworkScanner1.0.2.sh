#!/bin/bash
B='\e[0;30m'        # Black
R='\e[0;31m'        # Red
G='\e[0;32m'        # Green
Y='\e[0;33m'        # Yellow
P='\e[0;35m'        # Purple
C='\e[0;36m'        # Cyan
W='\e[0;37m'        # White
X='\e[0m'           # Text Reset
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

clear

#The following packages are REQUIRED for this program
packages=(iw wpa_supplicant wicd gtk+ wicd-gtk) #NetworkManager

function check(){
  if [ $? -eq 0 ];
  then
    echo -e ""$W"["$X""$G"OK"$X""$W"]"$X""
    true 
  else
    echo -e ""$W"["$X""$R"FAILED"$X""$W"]"$X""
    false
  fi
}

function pause(){
  local message="$@"
  [ -z $message ] && message=$(echo -e ""$Y"Press "$C"["$X""$R"Enter"$X""$C"]"$X" "$Y"Key To Continue..."$X"")
  read -p "$message" readEnterKey
}

#function wicd(){
#
#
#}

function networkScanner(){
FLAG=0
until [ $FLAG -eq 1 ];
do
  int=$(echo $(sudo iw dev |grep Interface) | tr " " " " | awk '{ print $2 }')
  echo -e ""$G"Scanning wifi network SSID's"$X"";sleep 1
  FLAG=0
  until [ $FLAG -eq 1 ];
  do
    Networks=$(sudo iw $int scan |grep SSID)
    sleep 1
    echo -e ""$P"Devices:\n"$X"$Networks"
    echo -e ""$C"Please Select SSID Network To Connect"$X""
    echo -e ""$P"Type"$X" "$C"'scan'"$X" "$P"or"$X" "$C"'SCAN'"$X" "$P"To Scan Again!"
    echo -e ""$P"Type"$X" "$R"'q'"$X" "$P"or"$X" "$R"'quit'"$X" "$P"To Quit"$X""
    echo -e ""$C"["$X""$R"SSID"$X""$C"]>|"$X"\c"
    read SSID
    if [ $SSID = 'scan' ] || [ $SSID = 'SCAN' ];
    then
      echo -e ""$G"Re-Scanning..."$X"";sleep 1
      FLAG=0
    elif [ $SSID = 'q' ] || [ $SSID = 'quit' ];
    then
      echo -e ""$G"Returning To Main Menu"$X"";sleep 1
      pause #Function
      exit
    else
      FLAG=1
    fi
  done
  
  declare -A Array
  for constant in $Networks
  do
    Array[$constant]=1
  done
  if [ ${Array[$SSID]} ]; 
  then
    #[Insert Code-Block Here <<EOF]
    #wicd #function
    FLAG=1
  else
    echo -e ""$R"Error, The SSID:"$X" "$C"$SSID"$X" "$R"Does Not Exist!"$X""
    FLAG=0
  fi
done
}

echo -e ""$G"Initializing..."$X"";sleep 1

echo -e ""$R"Required"$X" "$P"Packages: "$X""$C"${packages[*]}"$X"";sleep 1
echo -e ""$G"Scanning For Packages..."$X"";sleep 1
i=1
checker=0
for package in ${packages[*]}
do
  function isInstalled(){
    if yum list installed "$@" >/dev/null 2>&1
    then
      true
    else
      false
    fi
  }
  if isInstalled $package
  then
    echo -e ""$C"["$X""$Y"$i"$X""$C"]"$X" "$G"Package: "$X""$C"$package"$X" "$G"Is Installed"$X"";sleep 1
    let checker++
  else
    echo -e ""$C"["$X""$Y"$i"$X""$C"]"$X" "$R"Package: "$X""$C"$package"$X" "$R"Is Not Installed"$X"";sleep 1
    echo -e ""$G"Installing Package:"$X" "$C"$package"$X"";sleep 1
    sudo yum -y install $package #>/dev/null
    if [ $? -eq 0 ];
    then
      echo -e ""$G"Command Succeeded"$X""
      let checker++
    else
      echo -e ""$R"Command Failed"$X""
      #if
      echo -e ""$G"Trying Local Install..."$X""
      cd Packages/
      dir=$(ls |grep $package)
      cd $dir
      fullname=$(ls |grep $package)
      sudo yum -y localinstall $fullname
      if [ $? -eq 0 ];
      then
	echo -e ""$G"Command Succeeded"$X""
	let checker++
	cd ..
      else
	echo -e ""$R"Command Failed"$X""
	echo -e ""$R"CRITICAL ERROR"$X""
	echo -e ""$C"Please Contact Your Local"$X" "$C"Administrator!"$X""
	cd ..
      fi
    fi
  fi
  let i++
done

#echo ${#packages[@]}
#echo $checker
#exit

if [ $checker -lt ${#packages[@]} ];
then
  echo -e ""$R"All Programs Need To Be Installed To Initialize"$X" "$C"The Network Scanner"$X""$Y"!"$X""
elif [ $checker -eq ${#packages[@]} ];
then
  echo -e ""$C"All Required Programs Are Installed"$X""$Y"!"$X" "$P":)"$X""
  pause
  #i=1
  #while [ $i -le 20 ];
  #do
  #  R1=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  #  
  #  let i++
  #done

  R1=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R2=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R3=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R4=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R5=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R6=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R7=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R8=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R9=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R10=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  R11=$(echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m")
  
  echo -e ""$G"Starting Program..."$X"";sleep 1
  echo -e ""$Y"|"$X""$P"========================================"$X""$Y"|"$X""
  echo -e ""$Y"|"$X""$G"0010100111010001001010101010001001010100""$X"$Y"|"$X""
  echo -e ""$Y"|"$X""$P"========================================"$X""$Y"|"$X""
  echo -e ""$Y"|"$X""$On_Green"[12 / 27 / 2015]"$X"\t\t\t "$Y"|"$X""
  echo -e ""$Y"|"$X"\t\t\t\t\t "$Y"|"$X""
  echo -e ""$Y"|"$X""$C"     $(tput bold)$(tput smul)Welcome To The Network Scanner"$X""$Y"!"$X"$(tput rmul)    "$Y"|"$X"" 
  echo -e ""$Y"|"$X"\t\t\t\t\t "$Y"|"$X""
  echo -e ""$Y"|"$X"\t\tCreated By: "$R1"J$X""$R2""e"$X""$R3"s"$X""$R4"s"$X""$R5"e"$X" "$R6"G"$X""$R7"o"$X""$R8"i"$X""$R9"n"$X""$R10"g"$X""$R11"s "$X""$Y"|"$X""
  echo -e ""$Y"|"$X""$P"========================================"$X""$Y"|"$X""
  echo -e ""$Y"|"$X"$G""1010001010100010101010100010101101010110""$X"$Y"|"$X""
  echo -e ""$Y"|"$X""$P"========================================"$X""$Y"|"$X""
  #echo -e ""$C"Hello, Welcome To The Network Scanner"$X""$Y"!"$X""
  sleep 2
  echo
  FLAG=0
  until [ $FLAG -eq 1 ];
  do
    #echo -e ""$C"-"$X""$Y"="$X""$C"-"$X""$Y"="$X""$C"-"$X""$Y"="$C"-"$X""$Y"="$X""$C"-"$X""
    echo -e ""$Y"|"$X""$P"========================================"$X""$Y"|"$X""
    echo -e ""$Y"|"$X"$G""1010001010100010101010100010101101010110""$X"$Y"|"$X""
    echo -e ""$Y"|"$X""$P"========================================"$X""$Y"|"$X""
    echo -e ""$Y"|"$X"\t   $(tput bold)"$R"--"$X""$G"="$X""$P"<"$X""$C"["$X""$Y"Main Menu"$X""$C"]"$X""$P">"$X""$G"="$X""$R"--"$X"\t\t "$Y"|"$X""
    echo -e ""$Y"|"$X""$C"["$X""$Y"1"$X""$C"]"$X" "$P"="$X" "$R"Scan Network [Wifi]"$X"\t\t "$Y"|"$X""
    echo -e ""$Y"|"$X""$C"["$X""$Y"2"$X""$C"]"$X" "$P"="$X" "$Y"Scan IP Range [Eth0]"$X"\t\t "$Y"|"$X""
    echo -e ""$Y"|"$X""$C"["$X""$Y"3"$X""$C"]"$X" "$P"="$X" "$C"Launch: The Multi-Program"$X"\t "$Y"|"$X""
    #echo -e ""$Y"|"$X""$C"["$X""$Y"3"$X""$C"]"$X" "$P"="$X" "$C"Show List Of All Running Processes"$X""$Y"|"$X""
    #echo -e ""$Y"|"$X""$C"["$X""$Y"4"$X""$C"]"$X" "$P"="$X" "$B"Show Service List Of All Services"$X" "$Y"|"$X""
    #echo -e ""$Y"|"$X""$C"["$X""$Y"5"$X""$C"]"$X" "$P"="$X" "$P"Show Harddrive Partition Info"$X"     "$Y"|"$X""
    #echo -e ""$Y"|"$X""$C"["$X""$Y"6"$X""$C"]"$X" "$P"="$X" "$G"Show List Of Users Present"$X"        "$Y"|"$X"" 
    echo -e ""$Y"|"$X""$C"["$X""$Y"4"$X""$C"]"$X" "$P"="$X" "$On_Red"$(tput bold)Quit Program"$X"\t\t\t "$Y"|"$X""
    echo -e ""$Y"|"$X""$P"========================================"$X""$Y"|"$X""
    echo -e ""$Y"|"$X"$G""1010001010100010101010100010101101010110""$X"$Y"|"$X""
    echo -e ""$Y"|"$X""$P"========================================"$X""$Y"|"$X""
    echo -e "$C""What Would You Like To Do"$X""$Y"?"$X""
    #echo -e ""$C"Scan Network"$X""$Y"?"$X""
    echo -e ""$C"["$X""$Y"1"$X""$C"-"$X""$Y"4"$X""$C"]>|"$C"\c"
    read Ans1
    if [ $Ans1 -eq 1 ];
    then
      echo -e ""$C"Welcome To The Wifi Network Scanner"$X""$Y"!"$X"";sleep 1
      #Locate available wifi adapters
      Devices=$(echo $(sudo iw dev |grep Interface) | tr " " " " | awk '{ print $2 }')
      echo -e ""$P"Devices:"$X" "$C"${Devices[*]}"$X""  
      i=1
      for int in ${Devices[@]}
      do
	echo -e ""$P"Interface:"$X" "$Y"$i"$X")"
	echo '-------------------------'
	echo -e ""$G"Checking device:"$X" "$C"$int"$X" "$G"status"$X"";sleep 1
	sudo ip link show $int #Check device status
	#------------------------------------
	check #Function
	#------------------------------------
	echo -e ""$G"Bringing up wifi interface:"$X" "$C"$int"$X"";sleep 1
	sudo ip link set $int up #Bring up wifi interface
	#------------------------------------
	check #Function
	#------------------------------------
	echo -e ""$G"Checking connection status:"$X" "$C"$int"$X"";sleep 1
	status=$(sudo iw $int link) #Check connection status
	echo "$status"
	#------------------------------------
	check #Function
	#------------------------------------
	echo '-------------------------'
	let i++
      done
      if status=$(echo $status |grep Connected)
      then
	echo -e ""$R"You're Already Connected"$X" "$Y":P"$X""
	FLAG=0
	until [ $FLAG -eq 1 ];
	do
	  echo -e ""$C"Scan"$X" "$Y"&"$X" "$C"Connect Anyway"$X""$Y"?"$X""
	  echo -e ""$C"["$X""$G"y"$X""$C"/"$X""$R"n"$X""$C"]>|"$X"\c"
	  read Ans2
	  if [ $Ans2 = 'y' ] || [ $Ans2 = 'yes' ];
	  then
	    networkScanner #Function

	    FLAG=1
	  elif [ $Ans2 = 'n' ] || [ $Ans2 = 'no' ];
	  then
	    #echo -e ""$G"Skipping..."$X"";sleep 1
	    FLAG=1
	  else
	    echo -e ""$R"Invalid Syntax Given:"$X" "$C"$Ans1"$X"";sleep 1
	    echo -e ""$C"Correct Syntax:"$X" "$G"y"$X""$C"/"$X""$R"n"$X" "$C"or"$X" "$G"yes"$X""$C"/"$X""$R"no"$X"";sleep 1
	    echo -e ""$C"Lets Try Again"$X"";sleep 1 
	    FLAG=0 
	  fi
	done
      else
	if [ $(echo ${#Devices[@]}) -gt 1 ]; #-gt 1
	then
	  FLAG=0
	  until [ $FLAG -eq 1 ];
	  do
	    echo -e ""$P"You Have"$X" "$Y"${#Devices[@]}"$X" "$P"Wireless Devices:"$X" "$C"${Devices[*]}"$X"";sleep 1
	    echo -e ""$C"Please Select Interface To Use"$X""
	    echo -e ""$C"["$X""$R"${Devices[*]}"$X""$C"]>|"$X"\c"
	    read pickint
	    declare -A Array1
	    for constant in ${Devices[*]}
	    do
	      Array1[$constant]=1
	    done
	    if [ ${Array1[$pickint]} ]; 
	    then
	      #-------------------------------------------------------
	      FLAG=0
	      until [ $FLAG -eq 1 ];
	      do
		int=$pickint
		echo -e ""$G"Scanning wifi network SSID's"$X"";sleep 1
		FLAG=0
		until [ $FLAG -eq 1 ];
		do
		  Networks=$(sudo iw $int scan |grep SSID)
		  sleep 1
		  echo -e ""$P"Devices:\n"$X"$Networks"
		  echo -e ""$C"Please Select SSID Network To Connect"$X""
		  echo -e ""$P"Type"$X" "$C"'scan'"$X" "$P"or"$X" "$C"'SCAN'"$X" "$P"To Scan Again!"
		  echo -e ""$C"["$X""$R"SSID"$X""$C"]>|"$X"\c"
		  read SSID
		  if [ $SSID = 'scan' ] || [ $SSID = 'SCAN' ];
		  then
		    echo -e ""$G"Re-Scanning..."$X"";sleep 1
		    FLAG=0
		  else
		    FLAG=1
		  fi
		done
		declare -A Array
		for constant in $Networks
		do
		  Array[$constant]=1
		done
		if [[ ${Array[$SSID]} ]]; 
		then
		  #[Insert Code-Block Here <<EOF]
		  FLAG=1
		else
		  echo -e ""$R"Error, The SSID:"$X" "$C"$SSID"$X" "$R"Does Not Exist!"$X""
		  FLAG=0
		fi
	      done
	      #-------------------------------------------------------
	      FLAG=1
	    else
	      echo -e ""$R"Error, The Interface:"$X" "$C"$pickint"$X" "$R"Does Not Exist!"$X""
	      FLAG=0
	    fi
	  done
	elif [ $(echo ${#Devices[@]}) -eq 1 ]; #-eq 1
	then
	  networkScanner #Function

	elif [ $(echo ${#Devices[@]}) -lt 1 ]; #-eq 1
	then
	  echo -e ""$R"No Wireless Devices Were Detected On This Machine"$X""$Y"!"$X"";sleep 1
	  echo -e ""$C"Please Contact Your Local Administrator For Diagnosis"$X""
	  #Please Check That The Wireless Driver Is Installed
	  #Also Make Sure That Your Wireless Device Is Properly Connected
	  #To The Computer!
	  #
	  #Have A Nice Day! :3
	else
	  echo -e ""$R"Error, 404: Impossible Parameter(s) Given!"$X""
	fi
      fi
      echo -e ""$C"Task Complete"$X""$Y"!"$X"";sleep 1
      echo -e ""$G"Returning To Main Menu..."$X"";sleep 1
      FLAG=0
    elif [ $Ans1 -eq 2 ];
    then
      FLAG=0
      until [ $FLAG -eq 1 ]
      do 
	echo -e ""$C"Welcome To The"$X" "$G"IP Range Scanner"$X""$Y"!"$X"";sleep 1
	echo -e ""$C"Please Enter"$X" "$G"Start"$X" "$C"IP Address"$X""
	echo -e ""$C"["$X""$Y"IP1"$X""$C"]>|"$X"\c"
	read IP1
	echo
	echo -e ""$C"Please Enter"$X" "$R"End"$X" "$C"IP Address"$X""
	echo -e ""$C"["$X""$Y"IP2"$X""$C"]>|"$X"\c"
	read IP2
	echo
	echo -e ""$G"Start"$X" "$C"IP:"$X""$Y"$IP1"$X""
	echo -e ""$R"End""$X "$C"IP:"$X""$Y"$IP2"$X""
	echo 
	echo -e ""$C"Is This Correct"$X""$Y"?"$X""
	echo -e ""$C"["$X""$G"y"$X""$C"/"$X""$R"n"$X""$C"]>|"$X"\c"
	read Ans4
	if [ $Ans4 = 'y' ] || [ $Ans4 = 'yes' ]
	then
	  #-----------------------------------------
	  octA1=$(echo ${IP1} | tr "." " " | awk '{ print $1 }')
	  octA2=$(echo ${IP2} | tr "." " " | awk '{ print $1 }')
	  octB1=$(echo ${IP1} | tr "." " " | awk '{ print $2 }')
	  octB2=$(echo ${IP2} | tr "." " " | awk '{ print $2 }')
	  octC1=$(echo ${IP1} | tr "." " " | awk '{ print $3 }')
	  octC2=$(echo ${IP2} | tr "." " " | awk '{ print $3 }')
	  octD1=$(echo ${IP1} | tr "." " " | awk '{ print $4 }')
	  octD2=$(echo ${IP2} | tr "." " " | awk '{ print $4 }')
	  #-----------------------------------------
	  for a in `seq $octA1 $octA2`
	  do
	    for b in `seq $octB1 $octB2`
	    do
	      for c in `seq $octC1 $octC2`
	      do
		for d in `seq $octD1 $octD2`
		do
		  ping -c 1 -t 1 "${a}.${b}.${c}.${d}" >/dev/null 2>&1 &&
		  echo -e ""$C"Ping Status of"$X" "$Y"${a}.${b}.${c}.${d}"$X""$C": "$X"\t"$G"Success"$X"" ||
		  echo -e ""$C"Ping Status of"$X" "$Y"${a}.${b}.${c}.${d}"$X""$C": "$X"\t"$R"Failed"$X""
		done
	      done
	    done
	  done
      elif [ $Ans4 = 'n' ] || [ $Ans4 = 'no' ];
      then
	FLAG=0
      else
	echo -e ""$R"Invalid Syntax Given:"$X" "$C"$Ans1"$X"";sleep 1
	echo -e ""$C"Correct Syntax:"$X" "$G"y"$X""$C"/"$X""$R"n"$X" "$C"or"$X" "$G"yes"$X""$C"/"$X""$R"no"$X"";sleep 1
	echo -e ""$C"Lets Try Again"$X"";sleep 1 
      fi
      done
      echo -e ""$C"Task Complete"$X""$Y"!"$X"";sleep 1
      echo -e ""$G"Returning To Main Menu..."$X"";sleep 1      
      FLAG=0
    elif [ $Ans1 -eq 3 ];
    then
      echo -e "$C""Welcome To The Multi-Use Program""$X";sleep 1
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
	read Ans3

      if [ $Ans3 -eq 1 ];
      then
	echo -e "$G""Showing process list of all running processes""$X";sleep 3s
	echo -e "$R""Press 'q' When You Are Done Looking At The List""$X";sleep 2s
	ps aux |less 
	check #Function
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
		check #Function
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
      elif [ $Ans3 -eq 2 ]; 
      then
	echo -e "$G""Showing service list of all services""$X";sleep 3s
	service --status-all
	check #Function
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
		check #Function
		echo -e "$G"'---------------END_LIST'"$X"
		echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
		read -p ""
		#echo -e "$G""Returning To Main Menu""$X";sleep 1s
		FLAG_B=0
	      elif [ $ChoiceB -eq 2 ]; 
	      then
		echo -e "$G""Filtering Stopped Services""$X";sleep 3s
		service --status-all |grep stopped
		check #Function
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
      elif [ $Ans3 -eq 3 ]; 
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
		check #Function
		echo -e "$G"'---------------END_LIST'"$X"
		echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
		read -p ""
		#echo -e "$G""Returning To Main Menu""$X";sleep 1s
		FLAG_C=0
	      elif [ $ChoiceC -eq 2 ]; 
	      then
		echo -e "$G""Displaying All Linux Partitions""$X";sleep 3s
		sudo fdisk -l
		check #Function
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
      elif [ $Ans3 -eq 4 ]; 
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
		check #Function
		echo -e "$G"'---------------END_LIST'"$X"
		echo -ne "$P""Press"$Color_Off""$C" ["$Color_Off""$R"Enter"$Color_Off""$C"]"$Color_Off""$P" To "$G""Continue""$Color_Off""
		read -p ""
		#echo -e "$G""Returning To Main Menu""$X";sleep 1s
		FLAG_D=0
	      elif [ $ChoiceD -eq 2 ]; 
	      then
		echo -e "$G""Displaying All Users""$X";sleep 3s
		cut -d: -f1 /etc/passwd
		check #Function
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
      elif [ $Ans3 -eq 4 ]; 
      then
	echo -e ""$C"Task Complete"$X""$Y"!"$X"";sleep 1
	echo -e ""$G"Returning To Main Menu..."$X"";sleep 1
	#break
	FLAG=0
      else
	echo -e "$Red""Sorry, Wrong Input""$X"
	echo "Let's Try Again...";sleep 3s
	FLAG=0
      fi
      done
    elif [ $Ans1 -eq 4 ];
    then
      echo -e ""$C"Task Complete"$X""$Y"!"$X"";sleep 1
      echo -e ""$R"Exiting Program"$X"";sleep 1
      FLAG=1
    else
      echo -e ""$R"Invalid Syntax Given:"$X" "$C"$Ans1"$X"";sleep 1
      echo -e ""$R"Please Specify A"$X" "$C"Number"$X""
      echo -e ""$C"Lets Try Again"$X"";sleep 1  
      FLAG=0
    fi
  done 
else
  echo "Unexpected Error Occured"
fi
echo -e ""$R"Exiting Program"$X"";sleep 1
pause #Function
exit
