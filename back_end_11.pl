#!/usr/bin/perl
use strict;
use warnings;
use lib ".";

use Tools_Task_11_v2;

print "---------------------\n";
print "---  Задача 11(2) ---\n";
print "---------------------\n";

my $action = $ENV{action};
my $user_name = $ENV{user_name};
my $user_passwd = $ENV{user_passwd};

if ( $action eq 'login' ) {
    Tools_Task_11_v2::login( $user_name, $user_passwd );
} elsif ( $action eq 'reg') {
    Tools_Task_11_v2::reg_user( $user_name, $user_passwd );
} elsif ( $action eq 'del') {
    Tools_Task_11_v2::del_user ( $user_name );
} elsif ( $action eq 'change_passwd' ) {
    Tools_Task_11_v2::change_passwd( $user_name, $user_passwd );
}
