package PerlBlog::CategoryCrud;
 
use strict;
use warnings;

use PerlBlog::BaseCrud;
use PerlBlog::CategoriesDao;

our @ISA = qw(PerlBlog::BaseCrud);    # inherits from BaseDao

=head1 NAME
 
PerlBlog::CategoryCrud - Create Read Update Delete 
 
  Permite operar con la entidad Categoria.
 
=head2 Methods
 
=head3 new
 
Get an instance of LanguageCrud.
 
=cut
 
# The constructor of an object is called new() by convention.
 
sub new {
  my $class = shift;
    
  my $self = $class->SUPER::new( PerlBlog::CategoriesDao->new );
  
  bless $self, $class;
  return $self;
}


=head1 AUTHOR
 
  Gabriel Cugliari <ccugli%palermo_edu>
  Joel Planes <jplanes%palermo_edu>
 
=cut
 
1;
