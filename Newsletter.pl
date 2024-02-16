#!/usr/bin/perl
use strict;
use warnings;

print "----------------------\n";
print "---   Newsletter   ---\n";
print "----------------------\n\n";

my $text_file = "C:\\pl\\perl_problems\\files\\newsletter\\text_for_newsletter.txt";
my $bad_words_file = "C:\\pl\\perl_problems\\files\\newsletter\\ban_list.txt";

my @words_arr = &_read_text($text_file);
my @bad_words_arr = &_read_text($bad_words_file);

my %statistics;
my %bad_words_statistics;
my $constant = 2;

foreach my $word ( @words_arr ) {
    $word =~ s/[[:punct:]]//g;
    $word = lc( $word );
    if ( $word ) {
        $statistics{ $word }++;
        if ( grep { $_ eq $word } @bad_words_arr ) {
            $bad_words_statistics{ $word }++;
        }
    }
}
my $size = keys %statistics;

print "Всего в тексте употребляется $size слов(о)\n\n";

print "Список слов, которые встречаются более 2 раз:\n";
my @sorted_stat = sort { $statistics{$b} <=> $statistics{$a} } keys %statistics;
foreach my $word ( @sorted_stat ) {
    if ($statistics{$word} > $constant) {
        #TODO для адекватных отступов тут понадобится отдельная логика
        print "$word\t\tповторяется $statistics{$word} раз(а)\n";
    }
}

print "\n\nВ тексте встречены следущие матюги:\n";
my @sorted_stat_bad_word = sort { $bad_words_statistics{$b} <=> $bad_words_statistics{$a} } keys %bad_words_statistics;
foreach my $word ( @sorted_stat_bad_word ) {
    print "$word\t\tповторяется $bad_words_statistics{$word} раз(а)\n";
}

sub _read_text {
    my $file = shift;
	my @result_arr;
	open(FH, '<', $file) or die $!;
	while(<FH>){
		my @entries = split /\s+/, $_; 
		push( @result_arr, @entries );
	}
	close(FH);
    return @result_arr;
}
