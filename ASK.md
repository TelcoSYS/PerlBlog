Exporter
========

package PerlUP::Tools;
 
use base 'Exporter';
our @EXPORT = qw(is_integer is_unsigned);
our @EXPORT_OK = qw(getInput getResponseYes);

package main;

use PerlUP::Tools; ## necesario para import lo declarados en @EXPORT
use PerlUP::Tools qw(getInput getResponseYes);


