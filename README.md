# ZabbixWinCert

**RU:** Позволит отобразить все сертификаты в каталоге "Личные" на локальном компьютере и у текущего пользователя(сервис zabbix-agent'а должен быть запущен от нужного пользователя). Создаст элемент данных с именем сертификата и триггеры по окончанию.

**EN:** Allow to discover all cerificates on LocalMachine\My and CurrentUser\My (zabbix-service must be run under needed user). Discover rule will add all elements and triigets.

## Установка

Файлы:
- get_cert_current_date.ps1
- get_cert_local_date.ps1
- get_cert.ps1

скопировать в каталог с zabbix'ом.

В zabbix_agentd.win.conf добавить следующие строки(поменять путь до скрипта если надо):

```
UserParameter=cert.discovery[*],powershell -NoProfile -ExecutionPolicy Bypass -File C:\zabbix\get_cert.ps1 "$1"

UserParameter=cert.current.exp[*],powershell -NoProfile -ExecutionPolicy Bypass -File C:\zabbix\get_cert_date.ps1 "$1"

UserParameter=cert.local.exp[*],powershell -NoProfile -ExecutionPolicy Bypass -File C:\zabbix\get_cert_date.ps1 "$1"
```

Поменять или назначить у существующих нужных сертификатов "Понятное имя (Friendly Name)" в свойствах. Нельзя допустить повторения!

Добавить шаблон Template Windows Certificates.xml и дождаться окончания обнаружения.

**ВАЖНО:** Для работы скрипта нужен как минимум PowerShell версии не ниже 2.


## Installation

Files:
- get_cert_current_date.ps1
- get_cert_local_date.ps1
- get_cert.ps1

putt in folder with zabbix agent.

Modify zabbix_agentd.win.conf with (change path if needed):

```
UserParameter=cert.discovery[*],powershell -NoProfile -ExecutionPolicy Bypass -File C:\zabbix\get_cert.ps1 "$1"

UserParameter=cert.current.exp[*],powershell -NoProfile -ExecutionPolicy Bypass -File C:\zabbix\get_cert_date.ps1 "$1"

UserParameter=cert.local.exp[*],powershell -NoProfile -ExecutionPolicy Bypass -File C:\zabbix\get_cert_date.ps1 "$1"
```

Change or write Friendly Name in propertys of needed cerificate. DO NOT MAKE SAME NAMES!

Import "Template Windows Certificates.xml" and wait until discover rule complete job.

**IMPORTANT:** PowerShell must be version 2 or higher.
