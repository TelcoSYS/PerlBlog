package PerlUP::Tools;
 
use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw(trim ltrim rtrim is_integer is_unsigned is_positive);
our @EXPORT_OK = qw(getInput getResponseYes);


# Perl trim function to remove whitespace from the start and end of the string
sub trim
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}
# Left trim function to remove leading whitespace
sub ltrim
{
	my $string = shift;
	$string =~ s/^\s+//;
	return $string;
}
# Right trim function to remove trailing whitespace
sub rtrim
{
	my $string = shift;
	$string =~ s/\s+$//;
	return $string;
}

sub is_integer {

   # a valid integer 

   return (defined($_[0]) && $_[0] =~ /^\s*[\+\-]?\d+\s*$/);
}

sub is_unsigned {

   # a valid unsigned integer 
   return (defined($_[0]) && $_[0] =~ /^\s*\d+\s*$/);
}

sub is_positive {

   # a valid unsigned integer except zero
   # && $1 : true for 000 
   return ($_[0] && $_[0] =~ /^\s*(\d+)\s*$/) && ($1+0);
}

sub getInput {
  $_ = <STDIN>; chomp; 
  $_ =~ s/^\s+//;
  $_ =~ s/\s+$//;
  return ($_);
}

sub getResponseYes {
  print "(yes|no)? : ";	
  $_ = <STDIN>;  chomp ;
  return ( /^\s*Y(ES)?\s*$/i );
}


1;
