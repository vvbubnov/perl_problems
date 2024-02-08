#!/usr/bin/perl
use strict;
use warnings;

print "---	Калькулятор ---\n\n";

my ($first, $oper, $second);

print "Введите первое значение:\n";
chomp($_ = <STDIN>);
if (/\d/) {
  $first = $_;
} else {
  print "$_ - не является числом!\n\n";
}

print "Введите оператор:\n";
chomp($_ = <STDIN>);
if (/^[+\-\/\*]$/) {
  $oper = $_;
} else {
  print "$_ - не является оператором!\n\n";
}

print "Введите второе значение:\n";
chomp($_ = <STDIN>);
if (/\d/) {
  $second = $_;
} else {
  print "$_ - не является числом!\n";
}

my $result = "no_result";

if ($oper eq "+") {
  $result = $first + $second;
} elsif ($oper eq "-") {
  $result = $first - $second;
} elsif ($oper eq "*") {
  $result = $first * $second;
} elsif ($oper eq "/") {
  if ($second == 0) {
	$result = "div_by_zero";
	} else {
	$result = $first / $second;
	}
}

if ($result eq "div_by_zero") {
  print "Делить на ноль нельзя!";
} elsif ($result eq "no_result") {
	print "Результат не может быть получен";
} else {
  print "Результат: $result";
}
