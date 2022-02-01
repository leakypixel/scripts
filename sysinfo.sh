#!/bin/bash

# github.com/cannabispowered

# CPU Information
if command -v lscpu >/dev/null 2>&1; then
    C_MODEL=`lscpu | sed -nr '/Model name/ s/.*:\s*(.*) @ .*/\1/p'`
    C_CORES=`lscpu | grep '^CPU(s): ' | sed 's/^CPU(s): *//g'`
    C_CLOCK=`lscpu | grep 'MHz' | sed 's/CPU MHz: *//g'`
elif command -v nproc &> /dev/null; then
    C_MODEL=`cat /proc/cpuinfo | sed -nr '/model name/ s/.*:\s*(.*) @ .*/\1/p'`
    C_CORES=`nproc`
    C_CLOCK=`cat /proc/cpuinfo | grep 'MHz' | sed 's/cpu MHz\t*: //g'`
else
    C_MODEL=`cat /proc/cpuinfo | sed -nr '/model name/ s/.*:\s*(.*) @ .*/\1/p'`
    C_CORES=`grep -c 'processor' /proc/cpuinfo`
    C_CLOCK=`cat /proc/cpuinfo | grep 'MHz' | sed 's/cpu MHz\t*: //g'`
fi

# Memory Information
M_TOTAL=`free --si -g | grep 'Mem:' | awk '{print $2}'`
M_USED=`free --si -m  | grep 'Mem:' | awk '{print $3}'`
M_FREE=`free --si -m  | grep 'Mem:' | awk '{print $4}'`

NAME=$USER
HOSTNAME=`hostname`
EXTIP=`wget --quiet -O- ipv4.icanhazip.com || curl -s ipv4.icanhazip.com`
KERNEL=`uname -r | sed 's/ARCH/0x0/'`

if pidof httpd >/dev/null 2>&1; then
    WEBSERV="httpd"
elif pidof apache2 >/dev/null 2>&1; then
    WEBSERV="apache2"
elif pidof nginx >/dev/null 2>&1; then
    WEBSERV="nginx"
else
    WEBSERV=$(lsof -nP -iTCP -sTCP:LISTEN 2>/dev/null| grep :80  | awk '{print $1}' | head -1)":80"
    WEBSERV=$(lsof -nP -iTCP -sTCP:LISTEN 2>/dev/null| grep :443 | awk '{print $1}' | head -1)":443"
fi

# Banner
printf "\n  "
i=0
while [ $i -le 6 ]
do
  printf "\e[$((i+41))m\e[$((i+30))m█▓▒░"
  i=$(($i+1))
done
printf "\e[37m█\e[0m▒░\n\n"

printf " \e[1;33m      ┄┄┄━━━┄┄┄┄┄━━━┄┄┄\e[0m\n"
printf " \e[1;33m          user \e[0m$NAME\n"
printf " \e[1;33m            ip \e[0m$EXTIP\n"
printf " \e[1;33m      hostname \e[0m$HOSTNAME\n"
printf " \e[1;33m        kernel \e[0m$KERNEL\n"
printf " \e[1;33m      ┄┄┄━━━ CPU ━━━┄┄┄\e[0m\n"
#printf " \e[1;33m         model \e[0m$C_MODEL\n"
printf " \e[1;33m         cores \e[0m$C_CORES\n"
printf " \e[1;33m           mhz \e[0m$C_CLOCK\n"
printf " \e[1;33m      ┄┄┄━━━ RAM ━━━┄┄┄\e[0m\n"
printf " \e[1;33m         total \e[0m$M_TOTAL GB\n"
printf " \e[1;33m          used \e[0m$M_USED MB\n"
printf " \e[1;33m          free \e[0m$M_FREE MB\n"
if [ -z "$WEBSERV" ]; then
    printf " \e[1;33m ━━━ WEB ━━━\e[0m\n"
    printf " \e[1;33m     \e[0m$WEBSERV\n"
fi
printf " \e[1;33m      ┄┄┄━━━┄┄┄┄┄━━━┄┄┄\e[0m\n\n"
