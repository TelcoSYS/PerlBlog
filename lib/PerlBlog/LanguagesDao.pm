package PerlBlog::LanguagesDao;
 
use strict;
use warnings;

use PerlBlog::BaseDao;
use Data::Dumper;

use constant TABLENAME => "languajes";

our @ISA = qw(PerlBlog::BaseDao);    # inherits from BaseDao


=head1 NAME
 
PerlBlog::LanguagesDao - Capa para acceder a los datos.
 
=head1 SYNOPSIS

    use PerlBlog::LanguagesDao;
    my $langDao = PerlBlog::LanguagesDao->new();

 
=head1 DESCRIPTION
 
  Permite acceder a los datos guardas en la base de datos MySQL.
 
=head2 Methods
 
=head3 new
 
    my $langDao = PerlBlog::LanguagesDao->new();
 
Get an instance of LanguagesDao.
 
=cut
 
# The constructor of an object is called new() by convention.

# Override constructor
sub new {
    my ($class) = @_;

    # Call the constructor of the parent class, BaseDao.
    my $self = $class->SUPER::new( TABLENAME , "id" , { name => 2 } );
    $self->{cShow} = { id => "id", desc => "name", entity => "Idioma" };
    bless $self, $class;
    return $self;
}




#sub find {
#  my $self = shift;
#  my $row = $self->SUPER::find(@_);
#  return $row;
#}


1;
