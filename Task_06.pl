#!/usr/bin/perl
use strict;
use warnings;

print "------------------\n";
print "---  Задача 06 ---\n";
print "------------------\n";

my $conf_path = "C:\\pl\\perl_problems\\files\\conf.ini";

my %hash_from_file = &_read_conf;

print %hash_from_file;

sub _read_conf() {
	my @result_arr;
	my %result_hash;

	# быстро вытаскиваем записи из файла в массив
	# чтобы закрыть дескриптор как можно быстрее
	open(FH, '<', $conf_path) or die $!;
	while(<FH>){
		# В настоящее время я считаю разделителем пробел
		# Более сложную логику будем обыгрывать отдельно
		my @entries = split /\s+/, $_; 
		push( @result_arr, @entries );
	}
	close(FH);

	foreach ( @result_arr ) {
		print "entry	= $_\n";	#log
		unless (m/^#/) {
			if (m/^(\S+)=(\S+)$/) {
				print "key	= $1\n";	#log
				print "value	= $2\n\n";	#log
				$result_hash{$1} = $2;
			}
		} else {
			print "commented entry ignored\n";	#log
		}
	}

	return %result_hash;
}
