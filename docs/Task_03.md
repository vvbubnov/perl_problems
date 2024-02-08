# Задание 3
Что мы узнаем:
Знакомство с хэшом. 

Задача:
Заменить массив на хэш.

Описание:
Хэш - ассоциативный массив состоящий из ключей и значений.  Мы его уже видели в переменной %ENV. Его структура позволяет хранить разные параметры, например:
my $user_prms = (
    first_name => 'Гарри',
    last_name => 'Поттер',
    school      => 'Хогвардс',
);
Все просто и понятно. Забегая вперед могу сказать, что данные из базы мы получаем примерно так. В качестве ключей будут имена столбцов, а в качестве значений их значения =)

Итак, проверка имени пользователя в цикле это хорошо, но есть еще более 
быстрый способ - проверка по хэшу. Для этого цикл и не нужен вовсе.
Вам необходимо заменить массив @users_list на хэш %users_prms в котором в качестве ключа используется имя пользователя, а в качестве значения - его пароль. Далее проверить, что в хэше есть ключ с именем пользователя и если он есть, и пароль подходит, то вывести сообщение `Добро пожаловать '$user_name'!`, а если пользователь не найден, или пароль не подходит, вывести сообщение `Неверный логин или пароль.`

Подсказка:
Ключ в хеше проверяется оператором exists.

Полезные привычки:
Старайтесь писать стрелки => на одной линии, это радует глаз.

[РЕШЕНИЕ](../Task_03.pl)
---
[На главную](../README.md)