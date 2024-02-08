#!/usr/bin/perl
use strict;
use warnings;

# Решение с пользовательской функцией
# 	- минус лишняя переменная
#	  - минус лишние проверки после нахождения


print "---	Задача 01 ---\n\n";
my @users_list = qw( Tom John Donald );
chomp (my $user_input = <STDIN>);

if (&find($user_input, @users_list) == 1) {
  print "Приветствую тебя $user_input!";
} else {
  print "Ты кто такой $user_input?";
}

sub find {
  my($user_input, @users_list) = @_;
  for my $user_name(@users_list) {
    print "Processing with user $user_name from \@users_list \n";
    if ($user_input eq $user_name) {
      return 1;
    }
  }
  return 0;
}
