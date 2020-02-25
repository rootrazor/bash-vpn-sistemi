#!/bin/bash

##############################################################################################
# Created: Turkharekat.Com    RootRazor                                                        #
##############################################################################################



renk='\e[0;36m'
mavim='\e[1;34m'
beyaz='\e[1;37m'
NC='\e[0m'             

site="https://turkharekat.com"

yanlis="
\033[1;33m###################################################################\033[1;32m \033[0m
\033[1;33m#                                                                 #\033[1;32m \033[0m
\033[1;33m    \033[1;33m=> Yanlis tuslama yapildi, script kapatiliyor.      \033[0m      \033[1;33m \033[0m
\033[1;33m#                                                                 #\033[1;33m \033[0m
\033[1;33m###################################################################\033[1;32m \033[0m
"


#--------------------------------------------------------------------------------------#
update_sorun(){
clear
sleep 0.5
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;32m \033[0m"
echo -e "\033[1;33m     \033[1;33m=> cURL kütüphanesi eksik, lütfen yükleyin.      \033[0m         \033[1;33m \033[0m"
echo -e "\033[1;33m#    \033[1;31m=> apt-get install curl                        \033[0m\033[1;33m \033[0m"
echo -e "\033[1;33m#                                                                 #\033[1;33m \033[0m"
echo -e "\033[1;33m###################################################################\033[1;32m \033[0m"
exit

}



ana_kurulum_bilesenkur(){
sleep 1
clear
apt-get update -y
apt-get -y install pptpd
echo "ms-dns 8.8.8.8" >> /etc/ppp/pptpd-options
echo "ms-dns 8.8.4.4" >> /etc/ppp/pptpd-options
turkharekat=`ifconfig eth0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
echo "localip $turkharekat" >> /etc/pptpd.conf
echo "remoteip 10.1.0.1-100" >> /etc/pptpd.conf
clear
echo "rootrazor    pptpd   rootrazor  *" >> /etc/ppp/chap-secrets
service pptpd restart
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sysctl -p
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables-save
clear
sleep 1
echo "############################"
echo "VPN İP Adresi: " $turkharekat
echo "Kullanici adi: rootrazor "
echo "Sifre: rootrazor "
echo "############################"

}



                                                        

command -v curl >/dev/null 2>&1 || hatakaydi="1"
if [[ $hatakaydi -eq 1 ]]
    then
sleep 1
update_sorun
fi
sleep 0.5
clear
echo -e "\033\e[93mScript Açılıyor [TurkHarekat V1.0]\033[0m"
sleep 4
clear




    echo -e "\033[1;33m######################################################################\033[1;32m \033[0m"
echo -e "# ${beyaz}
#   #   P   r   o   j   e   #              TurkHarekat Yeni Sürüm V1 ${beyaz}
#  / \ / \ / \ / \ / \ / \ / \        --------------------------------${renk}
# ( T | H | T| R | A | Z | OR |${mavim}      ¦         TurkHarekat        ¦${beyaz}
#  \_/ \_/ \_/ \_/ \_/ \_/ \_/        --------------------------------
"${beyaz}
    echo -e "\033[1;33m \033[0;36m                                                             \033[1;33m \033[0m"
    echo -e "\033[1;33m# \033[0;36m=>  TurkHarekat VPN KURULUMU V1 \033[0m                       \033[1;33m \033[0m"
    echo -e "\033[1;33m# \033[0;36m=>  Geliştirici: RootRazor        \033[0m                       \033[1;33m \033[0m"
    echo -e "\033[1;33m# \033[0;36m=>  Website: turkharekat.com        \033[0m                       \033[1;33m \033[0m"
    echo -e "\033[1;33m######################################################################\033[1;32m \033[0m"
    echo -e "\033[1;31m1)  Hemen Kurulum Yap\033[0m"
    echo -e "\033[1;31m2)  Çıkış\033[0m"
read secenek

case $secenek in
 1)
ana_kurulum_bilesenkur
 ;;

esac
