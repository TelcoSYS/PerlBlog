#!/usr/local/bin/perl

 
use strict;
use warnings;

use Data::Dumper;

use lib "/home/cgc/Escritorio/PerlBlog/lib";

use PerlBlog::LanguagesDao;


my $langDao = PerlBlog::LanguagesDao->new;

my $row = $langDao->find(34);


print "end 1 undef \n" unless defined $row;

$row =  $langDao->find(4);

print "end 2 undef \n" unless defined $row;
