Exporter
========

package PerlUP::Tools;
 
use base 'Exporter';
our @EXPORT = qw(is_integer is_unsigned);
our @EXPORT_OK = qw(getInput getResponseYes);

package main;

use PerlUP::Tools; ## necesario para import lo declarados en @EXPORT
use PerlUP::Tools qw(getInput getResponseYes);

Method
======

Cuando de llama a un subrutina desde un metodo dentro del mismo package 
el programador se debe encargar de pasar $self ?

hs2x
====

Solo se una para distribuir paquete y generar documentacion
Tiene otro uso?



