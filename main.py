import subprocess


def rock_me(command, info):
    process = subprocess.Popen([command], stdout=subprocess.PIPE, shell=True, stderr=subprocess.PIPE, text=True)
    output, error = process.communicate()
    print(info)
    print("--------------------------------------------------")
    print(output)


# Дата и время
rock_me("date", "Дата и время")
rock_me('hostname','Имя хоста:')
rock_me('ip a', 'IP-адреса:')
rock_me('uname -a', 'Версия ядра ОС:')
rock_me('cat /etc/passwd', 'Список пользователей:')
rock_me('uptime', 'Время работы:')
rock_me('last', 'Последний запуск:')
rock_me('who', 'Пользователи:')
rock_me('groups', 'Группы пользователей:')



rock_me("Домашние директории пользователей", "ls /home")
rock_me("Директория рута", "ls /root")
rock_me("Краткий вывод структур директорий", "tree /home/пользователь\ntree /root")
rock_me("Папки для хранения данных программ", "/var\n/etc")
rock_me("Примеры папок с настройками", "/etc/mysql\n/etc/apache2")
rock_me("Директории браузерных баз (Firefox)", "~/.mozilla/firefox")
rock_me("Директории браузерных баз (Chrome)", "~/.config/google-chrome")
rock_me("Проверка доступности сети TOR", "torsocks curl https://check.torproject.org")
rock_me("Версия Wine", "wine --version")
rock_me("Установленное ПО", "dpkg --list | grep \"ii\"")
rock_me("История консоли", "history")
rock_me("Список процессов", "ps aux")
rock_me("Процессы в состоянии демона", "ps aux | grep 'D'")
rock_me("Скрытые файлы в домашних каталогах", "ls -a ~")


rock_me("date", "Дата и время")

rock_me("hostname\nip a", "Имя хоста и IP-адреса")

rock_me("uname -a", "Версия ядра ОС")

rock_me("cat /etc/passwd", "Список пользователей")

rock_me("uptime", "Uptime системы")

rock_me("last", "Список последних входов в систему")

rock_me("who", "Перечень текущих сессий")

rock_me("groups", "Привязка пользователей к группам")

rock_me("ls /home", "Домашние директории пользователей")

rock_me("ls /root", "Директория рута")

rock_me("tree /home/пользователь\ntree /root", "Краткий вывод структур директорий")

rock_me("/var\n/etc", "Папки для хранения данных программ")

rock_me("/etc/mysql\n/etc/apache2", "Примеры папок с настройками")

rock_me("~/.mozilla/firefox", "Директории браузерных баз (Firefox)")

rock_me("~/.config/google-chrome", "Директории браузерных баз (Chrome)")

rock_me("torsocks curl https://check.torproject.org", "Проверка доступности сети TOR")

rock_me("wine --version", "Версия Wine")

rock_me("dpkg --list | grep \"ii\"", "Установленное ПО")

rock_me("history", "История консоли")

rock_me("ps aux", "Список процессов")

rock_me("ps aux | grep 'D'", "Процессы в состоянии демона")

rock_me("ls -a ~", "Скрытые файлы в домашних каталогах")
