#!/usr/bin/perl
use strict;
use warnings;
use lib ".";

use Tools_Task_11;

print "------------------\n";
print "---  Задача 11 ---\n";
print "------------------\n";


# образцы для логина
my $good_log = "Norm_usr-1"; # good
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

action( "reg", $good_log, $good_pw);
#action( "change_passwd", $good_log, "A234!d-d--rewrite" );
#action( "del", $good_log );
