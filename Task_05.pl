#!/usr/bin/perl
use strict;
use warnings;

print "------------------\n";
print "---  Задача 05 ---\n";
print "------------------\n";

my $conf_path = "C:\\pl\\perl_problems\\files\\conf.ini";

my @arr_from_file = &_read_conf;

print "@arr_from_file";

sub _read_conf() {
	my @result_arr;

	open(FH, '<', $conf_path) or die $!;
	while(<FH>){
		# В настоящее время я считаю разделителем пробел
		# Более сложную логику будем обыгрывать отдельно
		my @entries = split /\s+/, $_; 
		push( @result_arr, @entries );
	}
	close(FH);

	return @result_arr;
}
