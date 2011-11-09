package PerlUP::Tools;
 
use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw(is_integer is_unsigned getResponseYes);

sub is_integer {

   # a valid integer 

   return $_[0] =~ /^\s*[\+\-]?\d+\s*$/;
}

sub is_unsigned {

   # a valid unsigned integer 
   return $_[0] =~ /^\s*\d+\s*$/;
}

sub getInput {
  <STDIN>; chomp;
}

sub getResponseYes {
  print "(yes|no)? : ";	
  $_ = <STDIN>;  chomp ;
  return ( /^\s*Y(ES)?\s*$/i );
}


1;
