#!/system/bin/sh

##############################################
# The SwapCLI Project ////////////////////// #
# Depeloved by : Wahyu Hidayat ///////////// #
# Github : https://github.com/WahyuHidayattz #
##############################################

# variabel color
blue='\e[1;34m'
green='\e[1;32m'
purple='\e[1;35m'
cyan='\e[1;36m'
red='\e[1;31m'
yellow='\e[1;33m'
default='\e[1;0m'

# variabel 
version="4.0"
ok="[\e[1;32m ok $default]"
fail="[\e[1;31mfail$default]"
bs="1024000"

# banner
banner(){
echo "$red                                       ___ "
echo "$red    ______      ______ _____     _____/ (_) "
echo "$red   / ___/ | /| / / __  / __ \   / ___/ / / "
echo "$default  (__  )| |/ |/ / /_/ / /_/ /  / /__/ / / "
echo " /____/ |__/|__/\__^_/ ^___/   \___/_/_/ "
echo "                    /_/$yellow version : $version "
echo "$default "
echo "$blue---[[$green swap cli : $version $blue]]"
echo "$blue---[[$green developer: wahyu hidayat $blue]]"
echo "$blue---[[$yellow https://github.com/WahyuHidayattz $blue]]$default"
echo " "
}

wrong(){
echo "Wrong choice !!"
sleep 1
echo -n "Closing swapcli "
sleep 1
echo "$ok"
}

swap_c(){
clear
banner
echo -n "Enter swap size [MB] : "
read swap_sizee
echo -n "Creating swap with $swap_sizee MB "
sleep 1
echo "$ok"
dd if=/dev/zero of=/data/swap.img bs=$bs count=$swap_sizee
sleep 1
echo -n "Activating swap "
sleep 1
echo "$ok"
sleep 1
mkswap /data/swap.img
sleep 1
swapon /data/swap.img
sleep 1
echo -n "Swap has been$green installed with $swap_sizee MB!!!$default"
sleep 1
echo " "
}

swap_size(){
clear
banner
echo " [1] 128 MB "
echo " [2] 256 MB "
echo " [3] 512 MB "
echo " [4] 1024 MB "
echo " [c] Custom Size "
echo " "
echo -n "Swapcli>> "
read size
if [ 0$size = 01 ]; then
echo -n "Installing swap "
sleep 1
echo "$ok"
sleep 1
echo -n "Creating swap.img in /data/swap.img "
sleep 1
echo "$ok"
sleep 1
dd if=/dev/zero of=/data/swap.img bs=$bs count=128
sleep 1
echo -n "Activating swap "
sleep 1
echo "$ok"
sleep 1
mkswap /data/swap.img
sleep 1
swapon /data/swap.img
sleep 1
echo -n "Swap has been$green installed!!!$default"
sleep 1
echo " "
elif [ 0$size = 02 ]; then
echo -n "Installing swap "
sleep 1
echo "$ok"
sleep 1
echo -n "Creating swap.img in /data/swap.img "
sleep 1
echo "$ok"
sleep 1
dd if=/dev/zero of=/data/swap.img bs=$bs count=256
sleep 1
echo -n "Activating swap "
sleep 1
echo "$ok"
sleep 1
mkswap /data/swap.img
sleep 1
swapon /data/swap.img
sleep 1
echo -n "Swap has been$green installed!!!$default"
sleep 1
echo " "
elif [ 0$size = 03 ]; then
echo -n "Installing swap "
sleep 1
echo "$ok"
sleep 1
echo -n "Creating swap.img in /data/swap.img "
sleep 1
echo "$ok"
sleep 1
dd if=/dev/zero of=/data/swap.img bs=$bs count=512
sleep 1
echo -n "Activating swap "
sleep 1
echo "$ok"
sleep 1
mkswap /data/swap.img
sleep 1
swapon /data/swap.img
sleep 1
echo -n "Swap has been$green installed!!!$default"
sleep 1
echo " "
elif [ 0$size = 04 ]; then
echo -n "Installing swap "
sleep 1
echo "$ok"
sleep 1
echo -n "Creating swap.img in /data/swap.img "
sleep 1
echo "$ok"
sleep 1
dd if=/dev/zero of=/data/swap.img bs=$bs count=1024
sleep 1
echo -n "Activating swap "
sleep 1
echo "$ok"
sleep 1
mkswap /data/swap.img
sleep 1
swapon /data/swap.img
sleep 1
echo -n "Swap has been$green installed!!!$default"
sleep 1
echo " "
elif [ 0$size = 0c ]; then
swap_c
elif [ 0$size ]; then
wrong
fi
}

swap_a(){
echo -n "Activating swap "
sleep 1
echo "$ok"
sleep 1
mkswap /data/swap.img
swapon /data/swap.img
sleep 1
echo -n "Swap has been$green actived!!!$default"
sleep 1
echo " "
}

swap_u(){
echo -n "Uninstalling swap "
swapoff /data/swap.img
echo "$ok"
sleep 1
echo -n "Swap has been$green uninstalled!!!$default"
sleep 1
echo " "
}

swap_r(){
echo -n "Uninstalling swap "
swapoff /data/swap.img
echo "$ok"
sleep 1
echo -n "Removing swap "
rm /data/swap.img
sleep 1
echo "$ok"
sleep 1
echo -n "Swap has been$green Removed!!!$default"
sleep 1
echo " "
}

buka(){
clear
banner
echo " [i] Install swap"
echo " [a] Active swap"
echo " [u] Uninstall swap"
echo " [r] Remove swap [remove swap.img file]"
echo " "
echo -n "Swapcli>> "
read swap
if [ 0$swap = 0i ]; then
swap_size
elif [ 0$swap = 0a ]; then
swap_a
elif [ 0$swap = 0u ]; then
swap_u
elif [ 0$swap = 0r ]; then
swap_r
elif [ 0$swap = 0exit ]; then
echo "Exit"
elif [ 0$swap ]; then
wrong
fi
}

clear
echo -n "Checking root access..."
sleep 1
perms=$(id|cut -b 5)
if [ $perms != 0 ]; then
clear
echo -n "Checking root access "
echo "$fail"
sleep 1
echo "You dont have root access on ur terminal"
elif [ $perms != 1 ]; then
clear
echo -n "Checking root access "
echo "$ok"
sleep 1
buka
fi