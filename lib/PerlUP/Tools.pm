package PerlUP::Tools;
 
use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw(is_integer is_unsigned is_positive);
our @EXPORT_OK = qw(getInput getResponseYes);


sub is_integer {

   # a valid integer 

   return $_[0] =~ /^\s*[\+\-]?\d+\s*$/;
}

sub is_unsigned {

   # a valid unsigned integer 
   return $_[0] =~ /^\s*\d+\s*$/;
}

sub is_positive {

   # a valid unsigned integer except zero
   # && $1 : true for 000 
   return ($_[0] =~ /^\s*(\d+)\s*$/) && ($1+0);
}

sub getInput {
  $_ = <STDIN>; chomp; 
  return ($_);
}

sub getResponseYes {
  print "(yes|no)? : ";	
  $_ = <STDIN>;  chomp ;
  return ( /^\s*Y(ES)?\s*$/i );
}


1;
