#!/usr/bin/perl
use strict;
use warnings;

print "---	Задача 03 ---\n\n";

my %users_prms = (
	Tom     => "aasd3g565",
	John    => "234uh5wd",
	Donald  => "a33sd4fdg675",
);

my $user_input = $ENV{user_name};
my $user_passwd = $ENV{user_passwd};

# Есть вариант отказаться от проверки exists
# всё будет работать, но будем получать warn:
# 	Use of uninitialized value 
if (exists $users_prms{$user_input} 
        && $users_prms{$user_input} eq $user_passwd) {
	print "Добро пожаловать $user_input!";			
} else {
	print "Неверный логин или пароль";
}
