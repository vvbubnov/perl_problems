#!/usr/bin/perl
use strict;
use warnings;
use lib ".";

use Tools_Task_12;

print "------------------\n";
print "---  Задача 12 ---\n";
print "------------------\n";

my $action = $ENV{action};
my $user_name = $ENV{user_name};
my $user_passwd = $ENV{user_passwd};

if ( $action eq 'login' && defined $user_name && defined $user_passwd ) {
    login( $user_name, $user_passwd );
} elsif ( $action eq 'reg' && defined $user_name && defined $user_passwd ) {
    reg_user( $user_name, $user_passwd );
} elsif ( $action eq 'del' && defined $user_name ) {
    del_user ( $user_name );
} elsif ( $action eq 'change_passwd' && defined $user_name && defined $user_passwd ) {
    change_passwd( $user_name, $user_passwd );
} else {
    print_help();
}
