#!/usr/local/bin/perl

 
use strict;
use warnings;

use Data::Dumper;
use open qw(:utf8 :std);

use lib "/home/cgc/PerlBlog/lib";

use PerlBlog::LanguagesDao;
#use PerlBlog::BaseCrud;
use PerlBlog::LanguageCrud;
use PerlUP::Tools qw(getInput getResponseYes);
use PerlUP::Tools;

#my $langDao = PerlBlog::LanguagesDao->new;
#print Dumper ($langDao);



#my $row = $langDao->find(34);
#print "end 1 undef \n" unless defined $row;
#$row =  $langDao->find(4);
#print "end 2 undef \n" unless defined $row;


#my $ret;
#while (1) {
#print "Numero: "	;
#   $ret = getInput();
#   print "ret: $ret\n";
#   print ((is_positive($ret))? "trule\n":"Facho\n");
#}

my $crud = PerlBlog::LanguageCrud->new ;

#$crud->delete;
#$crud->create;
#$crud->showMenu;

#my $categDao = PerlBlog::CategoriesDao->new;
#my $row = $categDao->findAll;

#use PerlBlog::MainMenu;

#PerlBlog::MainMenu->showMenu;

my $in = getInput;
print "[$in]\n";

print "salida";
