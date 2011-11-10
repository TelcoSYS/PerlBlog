package PerlBlog::CategoriesDao;
 
use strict;
use warnings;

use PerlBlog::BaseDao;
use Data::Dumper;

use constant TABLENAME => "categories";

our @ISA = qw(PerlBlog::BaseDao);    # inherits from BaseDao


=head1 NAME
 
PerlBlog::CategoriesDao - Capa para acceder a los datos.
 
=head1 SYNOPSIS

    use PerlBlog::CategoriesDao;
    my $categDao = PerlBlog::CategoriesDao->new();

 
=head1 DESCRIPTION
 
  Permite acceder a los datos guardas en la base de datos MySQL.
 
=head2 Methods
 
=head3 new
 
    my $categDao = PerlBlog::CategoriesDao->new();
 
Get an instance of LanguagesDao.
 
=cut
 
# The constructor of an object is called new() by convention.

# Override constructor
sub new {
    my ($class) = @_;

    # Call the constructor of the parent class, BaseDao.
    my $self = $class->SUPER::new( TABLENAME , "id" , { name => 2 } );
    $self->{cShow} = { id => "id", desc => "name", entity => "Categoria" };
    bless $self, $class;
    return $self;
}


1;
