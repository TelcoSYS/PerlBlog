package PerlBlog::BlogsDao;
 
use strict;
use warnings;

use PerlBlog::ConnectionManager;


=head1 NAME
 
PerlBlog::BlogsDao - Capa para acceder a los datos.
 
=head1 SYNOPSIS

    use PerlBlog::BlogsDao;
    my $blogsDao = PerlBlog::BlogsDao->new();

 
=head1 DESCRIPTION
 
  Permite acceder a los datos guardas en la base de datos MySQL.
 
=head2 Methods
 
=head3 new
 
    my $blogsDao = PerlBlog::BlogsDao->new();
 
Get an instance of BlogsDao.
 
=cut
 
# The constructor of an object is called new() by convention.
 
sub new {
  my $class = shift;
  
  my $cMan = PerlBlog::ConnectionManager->new();
  my $self = bless ({cMan => $cMan}, $class);  
 
  return $self;
}


=head3 new
 
    my $blogsDao = PerlBlog::BlogsDao->new();
 
Get an instance of BlogsDao.
 
=cut

sub delete {

}


1;
