#!/bin/bash
echo    "bienvenu à mon projet sys"
echo    "voici mon menu d'execution"
echo    "a-les informations sur les utilisateurs"
echo    "b-installation de xampp et son environnement"
echo    "c-archivage des elements de mon repertoire personnel"
echo    "d-les informations sur le disque, la memoire, le processeur et le swap"
echo   "q/Q-pour quitter mon script"
echo   "entrer votre choix"
read    choix
echo   "votre choix est: "$choix" "
case "$choix" in
a)
echo "informations sur les utilisateurs"
for users in user=$(cat /etc/passwd | cut -d: -f1)
do
echo $users
done
exit 0;;
b)
echo "installation de xampp"
sudo chmod 755 xampp-linux-*-installer.run
sudo ./xampp-linux-*-installer.run
sudo ln -s /opt/lampp/lampp /etc/rc2.d/s99lampp
sudo ln -s /opt/lampp/lampp /etc/rc1.d/k02lampp
exit 0;;
c)
echo "archivage des elements du repertoire personnel"
mkdir monrep
jour=backup -$(date +%d+%m+%y) ar={2: -$jour} archivage=$(tar zvcf "monrep.tar.gz" $ar.gz ~/)
echo $archivage
exit 0;;
d)
echo "informations sur le disque, memoire, processeur et swap"
cpu=$(cat /proc/cpuinfo)
echo $cpu
mem=$(cat /proc/meminfo)
echo $mem
disk=$(sudo hdparm -i /dev/sda)
echo $disk
exit 0;;
q/Q)
echo "Au revoir"
exit 0;;
*)
echo "choix inexistant dans le menu"
echo "Au revoir"
exit 0;;
esac
