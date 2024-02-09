#!/usr/bin/perl
use strict;
use warnings;

print "-----------------------\n";
print "---   Bubble Sort   ---\n";
print "-----------------------\n";

my @unsort_arr = qw( 6 3 5 7 1 4 2 );
print "Unsorted array:\t@unsort_arr\n";
my @sorted_arr = &_sort(@unsort_arr);
print "Sorted array:\t@sorted_arr\n";

sub _sort {
    my @arr = @_;
    my $i = 0;
    my $n = $#arr + 1;
    my $in_progress = 1;

    while ($i < $n && $in_progress) {
        $in_progress = 0;
        for (my $j = 1; $j < $n; $j++) {
            if ($arr[$j - 1] > $arr[$j]) {
                ( $arr[$j - 1], $arr[$j] ) = ( $arr[$j], $arr[$j - 1] );
                $in_progress = 1;
            }
        }
        unless ($in_progress) {
            $i = $n;
        } else {
            $i++;
        }
    }
    return @arr;
}
