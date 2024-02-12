#!/usr/bin/perl
use strict;
use warnings;

print "-------------------------\n";
print "---   Binary search   ---\n";
print "-------------------------\n";

my @sorted_arr = qw( -31 -4 2 5 7 8 9 11 13 18 42 133 134 136 199 );
my $key = 10;
my $min = 0;
my $max = $#sorted_arr;
my $in_progress = 1;
my $index = "not found";

while ($min <= $max && $in_progress) {
    my $mid = int($min + (($max - $min) / 2));
    if ($sorted_arr[$mid] < $key) {
        $min = $mid + 1;
    } elsif ($sorted_arr[$mid] > $key) {
        $max = $mid - 1;
    } else {
        $index = $mid;
        $in_progress = 0;
    }
}

unless ($index eq "not found") {
    print "You key \"$key\" found at index $index";
} else {
    print "You key \"$key\" not found";
}
