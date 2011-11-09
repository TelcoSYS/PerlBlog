#!/usr/local/bin/perl

 
use strict;
use warnings;

use Data::Dumper;
use open qw(:utf8 :std);

use lib "/home/cgc/PerlBlog/lib";

use PerlBlog::LanguagesDao;


my $langDao = PerlBlog::LanguagesDao->new;

#my $row = $langDao->find(34);
#print "end 1 undef \n" unless defined $row;
#$row =  $langDao->find(4);
#print "end 2 undef \n" unless defined $row;

my $rows = $langDao->findAll;
#print Dumper ($rows);

print "\t  ID\tLanguage\n";
print "\t====\t======================\n";

for my $row (@$rows) {
  printf "\t%4s\t%-5s\n", $row->{id}, $row->{name};
}


#my $categDao = PerlBlog::CategoriesDao->new;
#my $row = $categDao->findAll;

