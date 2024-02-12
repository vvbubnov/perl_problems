#!/usr/bin/perl
use strict;
use warnings;

print "------------------\n";
print "---  Задача 04 ---\n";
print "------------------\n";

my %users_prms = (
	Tom     => "aasd3g565",
	John    => "234uh5wd",
	Donald  => "a33sd4fdg675",
);

my $user_name = $ENV{user_name};
my $user_passwd = $ENV{user_passwd};

if ( _login( $user_name, $user_passwd) == 0) {
	print "$user_name успешно аутенфицирован!\n";
} else {
	print "Неудачная аутентификация\n";
}

sub _login() {
	my ($user_name, $user_passwd) = @_;
	my $result = 0;

	if ( ! defined $user_name ) {
		print "Не указано имя пользователя\n";
		$result = -1;
	}
	if ( ! defined $user_passwd ) {
		print "Не указан пароль\n";
		$result = -1;
	}
	if ( $result != -1 
		&& exists $users_prms{$user_name} 
        && $users_prms{$user_name} eq $user_passwd ) {
		$result = 0;			
	} else {
		$result = -1;
	}
	return $result;
}
