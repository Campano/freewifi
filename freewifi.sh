#!/bin/sh
echo "========Connecteur FreeWifi============"
read -p "Login: " id
read -p "Password: " -s pass
echo
echo "--- Démarrage des tentatives de connexion"

search_msg="Site accessible uniquement"
msg_detected=0
i=0
while [ $msg_detected -eq 0 ]
do
  i=$(($i+1))
  echo "Tentative #$i"
  msg_detected=$(curl --request POST --url https://wifi.free.fr/Auth --form login=$id --form password=$pass 2>/dev/null | grep -cim1 "$search_msg")
done

echo "--- Success"
exit 1
