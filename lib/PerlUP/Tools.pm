package PerlUP::Tools;
 
use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw(is_integer is_unsigned);

sub is_integer {

   # a valid integer 

   return $_[0] =~ /^\s*[\+\-]?\d+\s*$/;
}

sub is_unsigned {

   # a valid unsigned integer 
   return $_[0] =~ /^\s*\d+\s*$/;
}
1;
