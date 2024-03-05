#!/usr/bin/perl
use strict;
use warnings;
use XML::LibXML;

my $file_path = 'C:\\pl\\perl_problems\\files\\simple.xml';

my $parser = XML::LibXML->new();

my $dom;
eval {
    $dom = $parser->parse_file($file_path);
} or do {
    die 'Ошибка при парсинге XML-файла: ' . $@;
};

my $root = $dom->getDocumentElement();
my @children = $root->nonBlankChildNodes();

foreach my $child (@children) {
    my $tag_name = $child->nodeName;
    my $tag_content = $child->textContent;

    # Выводим на экран имя тега и его содержимое
    print "Тег: $tag_name\n";
    print "Содержимое: $tag_content\n";
    print "--------------------\n";
}
