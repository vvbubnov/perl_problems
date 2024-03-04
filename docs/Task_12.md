# Задание №12
**Что мы узнаем**:  
Как делать пользовательский интерфейс более удобным.

**Задача**:
Добавить описание вызова скрипта.

**Описание**:  
У всех пакетных скриптов *linux* есть опция ```-h``` которая вызывает ```help``` по скрипту и подробно описывает возможноси его работы. Давайте сделаем аналогично и в нашем скрипте. Если скрипт вызван без параметров совсем (либо недостает одного параметра), то выводится сообщение с внятным описанием по работе со скриптом.

```
back_end.pl usage
action=reg user_name=NAME user_passwd=PASSWD ./back_end.pl - registaton new user in system;
action=log user_name=NAME user_passwd=PASSWD ./back_end.pl - login in system
action=del user_name=NAME ./back_end.pl - remove user from system
action=change_passwd user_name=NAME user_passwd=PASSWD ./back_end.pl - change user password
```
**Полезные привычки**:  
Обычно написанные скрипты живут очень долго, а их входные интерфейсы забываются. Оставив простое описание, вы облегчите жизнь себе и программистам которые будут сопровождать ваш код.


РЕШЕНИЯ: [Модуль](../Tools_Task_12.pm), [Скрипт](../back_end_12.pl)
---
[На главную](../README.md)
