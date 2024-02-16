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

my $sub_result = $back_log / ( ( $productivity - $new_tasks ) * $DAYS_IN_SPRINT );

# округление
my $result = ( $sub_result == int( $sub_result ) ) 
        ? $sub_result 
        : int( $sub_result ) + 1;
# округление

my $output = ( $result > 0 )
        ? "Колличество спринтов за которое Улиточка должна успеть: $result" 
        : "Улиточка не справится :(";
print "$output";

sub _user_input {
    print shift;
    chomp ( my $user_input = <STDIN> );
    return $user_input;
}
