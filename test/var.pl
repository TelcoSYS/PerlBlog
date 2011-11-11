#!/usr/local/bin/perl

 
use strict;
use warnings;

use Data::Dumper;
use open qw(:utf8 :std);

use lib "/home/cgc/PerlBlog/lib";

my @arr = ( 452 , 'pepe221',7,8,0,8,7);
my $arref = \@arr;
my @epp = @$arref;
my $cnt = scalar @arr;
print "$cnt - $#$arref\n";

sub readFiled {
  my ($name,$row,$key,$type) = @_;	
  
  my $act = (defined $row->{$key})? " [$row->{$key}]":"";
  print "$name$act: "; 
  #$in = trim(getInput());
  #unless (is_unsigned $in) { print "Numero invalido...\n"; return; }
  #$row->{category_id} = $in; 
    
}

readFiled "Categoria", {title =>'pepe'}, 'title',2;

print "salida\n";
