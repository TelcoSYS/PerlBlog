package PerlBlog::BlogsDao;
 
use strict;
use warnings;

use PerlBlog::BaseDao;

use constant TABLENAME => "blogs";

our @ISA = qw(PerlBlog::BaseDao);    # inherits from BaseDao


=head1 NAME
 
PerlBlog::BlogsDao - Capa para acceder a los datos.
 
=head1 SYNOPSIS

    use PerlBlog::BlogsDao;
    my $dao = PerlBlog::BlogsDao->new();

 
=head1 DESCRIPTION
 
  Permite acceder a los datos guardas en la base de datos MySQL.
 
=head2 Methods
 
=head3 new
 
    my $dao = PerlBlog::BlogsDao->new();
 
Get an instance of LanguagesDao.
 
=cut
 
# The constructor of an object is called new() by convention.

# Override constructor
sub new {
    my ($class) = @_;

    # Call the constructor of the parent class, BaseDao.
    my $self = $class->SUPER::new( TABLENAME , "id" , { title => 2, category_id => 1, languaje_id => 1 } );
    $self->{cShow} = { id => "id", desc => "title", entity => "Blog" };
    bless $self, $class;
    return $self;
}

=head3 create     

  $dao->create($name);  

Delete a row. 

=cut

sub create {
  my ($self,$row) = @_;
   
  my $sql = "INSERT INTO $self->{table} SET " ;
  my $fld = $self->{colm}; 
  my $coma = 0; my $quote ;
  for my $key (keys(%$fld)) {
	  $quote = ($fld->{$key} == 2)? "'":"" ;
	  $sql .= (($coma)?", ":"") . "$key = $quote$row->{$key}$quote ";
	  $coma = 1;
  }
  $sql .= " ;" ;
     
  return $self->{cMan}->update($sql);
}



1;
