#!/bin/bash
#Скрипт собирает информацию о системе Linux
#Запуск  chmod +x script_info.sh
# .\script_info.sh
# Либо sh script_info.sh
#Считывание данных из ОС Linux
#1. Данные о хосте (дата, имя хоста, ip адресацию, ядро ОС, список
#пользователей, uptime, список последних входов в систему, перечень
#текущих сессий, привязка пользователей к группам).
#2. Информация о директориях пользователей и рута. Здесь также нужно
#показать краткий вывод структур директорий.
#3. Папки, куда данные программы могут писать полезную инфу, например
#хранить базы, пароли, историю и прочие сведения.
#4. Браузерные базы, где хранятся настройки, пароли, закладки и история
#посещений.
#5. Наличие wine и перечень ПО установленного там
#6. История консоли
#7. Информация об обращении к сети TOR
#8. Перечень процессов системы, в том числе в состоянии демона
#9. В скрытых файлах (в Linux начинаются с точки) в домашних каталогах
#пользователей хранятся файлы разных конфигов, они могут содержать
#полезную информацию о последней активности, сохраненных сессиях и
#истории команд, набранных в терминале


echo "Данные о хосте"
echo "--------------------------------------------------"
echo -en '\nИмя хоста:\n'
hostname
echo -en '\nДата и время на хосте:\n'
date

echo -en '\nСетевые интерфейсы:\n'
ip a
echo -en '\nВерсия ядра ОС:\n'
uname -a

echo -en '\nСписок пользователей:\n'
#awk -F: '{print $1 }' /etc/passwd

USERS=$(awk -F: '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd)

echo $USERS 'root'

echo -en '\nВремя работы:\n'
uptime
echo -en '\nПоследний запуск:\n'

echo -en '\nПользователь:\n'
who
echo -en '\nГруппы пользователей:\n'
groups

echo -en "\nИнформация о директориях пользователей и рута.\n"
echo "--------------------------------------------------"

# shellcheck disable=SC1073
for user in $USERS;
do
echo "$user"
ls -l /home/"$user"
echo -en "\n"
done

echo 'root'
ls -l /root

echo -en "\n"

echo -en "\nПапки, куда данные программы могут писать полезную инфу, например хранить базы, пароли, историю и прочие"
echo -en "сведения.\n"
echo "--------------------------------------------------"

ls /etc

echo -en "\nБраузерные базы, где хранятся настройки, пароли, закладки и история посещений."
echo "--------------------------------------------------"
echo -en "\n"

for user in $USERS;
do
echo "$user"
echo "Chrome"
ls  /home/"$user"/.cache/
echo "Firefox"
ls  /home/"$user"/.mozilla/
echo -en "\n"
done

echo -en "\nИнформация об обращении к сети TOR\n"
echo "--------------------------------------------------"
echo -en "n"
# shellcheck disable=SC2002
cat /var/log/syslog | grep tor -i

echo -en "\nНаличие wine и перечень ПО установленного там\n"
echo "--------------------------------------------------"
wine --version
echo -en "\n"

for user in $USERS;
do
echo $user
ls  /home/.wine/
echo -en "\n"
done

echo -en "\nИстория консоли\n"
echo "--------------------------------------------------"
for user in $USERS;
do
echo $user
cat /home/$user/.zsh_history
echo -en "\n"
done

echo "root"
cat /home/root/.zsh_history
echo -en "\n"


echo -en "\nПеречень процессов системы, в том числе в состоянии демона\n"
echo "--------------------------------------------------"
ps aux

echo -en "\nCкрытые файлы (в Linux начинаются с точки) в домашних каталогах пользователей\n"
echo "--------------------------------------------------"

for user in $USERS;
do
echo $user
ls -a /home/$user
echo -en "\n"
done

echo 'root'
ls -a /root

echo -en "\n"

