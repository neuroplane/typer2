#!/bin/bash
############################
##### DIRECTORY CHECK  #####
############################
if [ ! -d /tmp/typer ]; then
	mkdir /tmp/typer
	clear
	echo "CREATED SCRIPTS DIRECTORY"
	sleep 4
fi
if [ ! -f /tmp/typer/wc.t ]; then 
	echo "1" > /tmp/typer/wc.t
	echo "CREATED WORDS COUNT FILE"
	sleep 4
fi
if [ ! -d /media/pi/HOME128 ]; then 
	clear
	echo -e "\033[41m\033[30mNO USB DRIVE MOUNTED!\nMOUNT DRIVE AND RELAUNCH SCRIPT!\033[0m"
	sleep 4
	exit
fi
############################
#####   MAIN SCRIPT    #####
############################
wc=$(head -n1 /tmp/typer/wc.t)
t=0
clear
echo -e "\033[42m\033[30mENTRIES LEFT: $wc\n\n\033[0m"

while [ $t -lt $wc ]
	do
		digit1=$(($RANDOM % 5 + 1))
		digit2=$(($RANDOM % 5 + 1))
		digit3=$(($digit1 + $digit2))
		echo -e "COMPUTE: \033[33m$digit1 + $digit2\033[0m"
		read vari
		if [ "$vari" = "$digit3" ]; then
			clear
			t=$(( $t + 1 ))
			y=$(( $wc - $t))
			echo -e "\033[42m\033[30mCORRECT! ENTRIES LEFT:$y\nSECONDS PASSED: $SECONDS\n\033[0m"
		else
			clear
			t=$(($t - 1))
			y=$(( $wc - $t))
			echo -e "\033[41m\033[30mINCORRECT! ENTRIES LEFT: $y\nSECONDS PASSED: $SECONDS\n\033[0m"
		fi
	done
echo $(($wc + 1)) > /tmp/typer/wc.t
############################
##### CARTOON  CHOOSE  #####
############################
clear
echo -e "ВЫБЕРИ МУЛЬТФИЛЬМ"
vfolder="/media/pi/HOME128/Videos/"
options=($(ls $vfolder))
folders=$(ls $vfolder | wc -l)
x=0
while [ $x -lt $folders ]
do
  echo -e "\033[33m$x\033[0m. ${options[$x]}"
  x=$(( $x + 1 ))
done
read selector
vfile=$(ls "$vfolder${options[$selector]}" | shuf -n 1)
clear
echo -e "NOW PLAYING: \033[33m$vfile\033[0m"
sleep 3
omxplayer "$vfolder${options[$selector]}/$vfile"
./typer.sh
