#!/usr/bin/perl
use strict;
use warnings;

print "\n";
print "------------------\n";
print "---  Улиточка  ---\n";
print "------------------\n";

my $DAYS_IN_SPRINT  = 10;
my $back_log        = &_user_input("Сколько таскок у нас в бэклоге: ");
my $new_tasks       = &_user_input("Сколько новых таскок прилетает в день: ");
my $productivity    = &_user_input("Сколько таскок в день умеет делать Улиточка: ");

my $output = ( $new_tasks >= $productivity )
    ? 'Улиточка не справится :('
    : &_get_result;
print "$output";

sub _user_input {
    print shift;
    chomp ( my $user_input = <STDIN> );
    return $user_input;
}

sub _get_result {
    my $sub_result = $back_log / ( ( $productivity - $new_tasks ) * $DAYS_IN_SPRINT );
    my $result = ( $sub_result == int( $sub_result ) )
        ? $sub_result
        : int( $sub_result ) + 1;
    my $suffix = ( $result == 1 )
        ? ''
        : ( $result >= 2 && $result <= 4 )
            ? 'а'
            : 'ов';
    return $result .' спринт' . $suffix;
}
