#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

use lib 'C:\\pl\\perl_problems';
use Tools_Task_12;

# Существующий пользователь
my $existing_user = 'Tom';
my $existing_passwd = 'aasd3g565';

# образцы для логина
my $good_log = "Norm_pw-1"; # good
my $number = "2pw";
my $cirilic = "кириллица";
my $s_symb = "pw!";
my $start = "_pw";
my $end = "pw-";

# образцы для пароля
my $good_pw = "A234!d-d"; # good
my $small = "A!34567";
my $start_pw = "1!A45678";
my $s_symb_pw = "A2345678";
my $registr = "a234!d-d";
my $digit = "Aaaa!d-d";
my $omg = " ";

# Тестируем login()
is(login( $existing_user, $existing_passwd ), 1, 'Успешная аутентификация существующего пользователя');
is(login( $good_log, $existing_passwd ), 0, 'Пользователя не найден - нет аутентификации');
is(login( $existing_user, $good_pw ), 0, 'Неверный пароль - нет аутентификации');
is(login( undef, $good_pw ), 0, 'Не передан логин - нет аутентификации');
is(login(), 0, 'Не передан пароль - нет аутентификации');
is(login(), 0, 'Не передано ничего - нет аутентификации');

# Тестируем reg_user()
is( reg_user( $good_log, $good_pw ) , 1, 'Имя пользователя соответствует требованиям' );
del_user( $good_log );
# 1. Плохой юзернейм
is( reg_user( $number, $good_pw ), 0, 'Имя пользователя начинается с цифры - проверка не пройдена' );
is( reg_user( $cirilic, $good_pw ), 0, 'Имя пользователя содержит кириллицу - проверка не пройдена' );
is( reg_user( $s_symb, $good_pw ), 0, 'Имя пользователя содержит спецсимвол - проверка не пройдена' );
is( reg_user( $start, $good_pw ), 0, 'Имя пользователя начинается не с буквы - проверка не пройдена' );
is( reg_user( $end, $good_pw ), 0, 'Имя пользователя заканчивается не на цифру или букву - проверка не пройдена' );
# Плохой пароль
is( reg_user( $good_log, $small ), 0, 'Пароль содеражит менее 8 символов - проверка не пройдена' );
is( reg_user( $good_log, $start_pw ), 0, 'Пароль начинается не с латинской буквы - проверка не пройдена' );
is( reg_user( $good_log, $s_symb_pw ), 0, 'Пароль не содержит ни одного спецсимвола - проверка не пройдена' );
is( reg_user( $good_log, $registr ), 0, 'Пароль не содержит ни одного символа в верхнем регистре - проверка не пройдена' );
is( reg_user( $good_log, $digit ), 0, 'Пароль не содержит ни одной цифры - проверка не пройдена' );
is( reg_user( $good_log, $omg ), 0, 'Передали пробел - проверка не пройдена' );



done_testing();
