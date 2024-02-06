#!/usr/bin/perl
use strict;
use warnings;

print "---   TRY   ---\n\n";

my @input_arr;
my $result;
my $in_progress = 1;
my $in_division = 0;

&get_user_digit();
while ($in_progress) {
	$in_division = 0;
	&get_user_oper();
	if ($_ eq "/") {
		$in_division = 1;
	}
	if ($in_progress) {
		&get_user_digit();
		calculate(@input_arr);
		print "\t промежуточное значение: $result \n";
		@input_arr = ( $result );
	}	
}
print "$result";

sub get_user_digit {
	my $repeat = 1;
	while ($repeat == 1) {
		print "Введите число: ";
		chomp($_ = <STDIN>);
		if ($in_division && $_ == 0) {
			$repeat = 1;
			print "ОШИБКА! На ноль делить нельзя!\n\n";
		} elsif (/^[-+]?\d+(\.\d+)?$/) {
			$repeat = 0;
			push (@input_arr, $_);
		} else {
			$repeat = 1;
			print "$_ - не является числом!\n\n";
		}
	}
}

sub get_user_oper {
	my $repeat = 1;
	while ($repeat == 1) {
		print "Введите оператор: ";
		chomp($_ = <STDIN>);
		if (/^[+\-\/\*]$/) {		
			$repeat = 0;
			push (@input_arr, $_);
		} elsif ($_ eq "=") {
			$repeat = 0;
			$in_progress = 0;
			print "\t Итоговое значение: "
		} else {
			$repeat = 1;
			print "$_ - не является оператором!\n\n";
		}
	}
}

sub calculate () {
	my ($first, $oper, $second) = @_;

	if ($oper eq "+") {
		$result = $first + $second;
	} elsif ($oper eq "-") {
		$result = $first - $second;
	} elsif ($oper eq "*") {
		$result = $first * $second;
	} elsif ($oper eq "/") {
		$result = $first / $second;
	}
}
