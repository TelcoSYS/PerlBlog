package PerlBlog::BaseDao;
 
use strict;
use warnings;

use PerlBlog::ConnectionManager;
use PerlUP::Tools;


=head1 NAME
 
PerlBlog::BaseDao - Capa para acceder a los datos.
 
=head1 SYNOPSIS

    use PerlBlog::BaseDao;
	my $baseDao = PerlBlog::BaseDao->new();
 
=head1 DESCRIPTION
 
  Permite acceder a los datos guardas en la base de datos MySQL.
 
=head2 Methods
 
=head3 new
 
    my $baseDao = PerlBlog::BaseDao->new();
 
Get an instance of BaseDao.
 
=cut
 
# The constructor of an object is called new() by convention.
 
sub new {
  my ($class, $table, $cid, $colm) = @_;
   
  my $cMan = PerlBlog::ConnectionManager->new();
  my $self = {cMan => $cMan, table => $table, cid => $cid, colm => $colm };
    
  $self = bless ($self, $class);  
 
  return $self;
}


=head3 find
 
    my $row = $baseDao->find($rid); 
 
Find a row by ID.
 
=cut

sub find {
  my ($self,$id) = @_;
  
  return undef unless is_unsigned ($id);
  
  my $cid = $self->{cid};
  my $colm = $self->{colm};
  
  my $sql = "SELECT " . join_fields($cid,$colm) . " FROM $self->{table} WHERE $cid = $id ;" ;
  
  print "Debug: $sql\n";
  
  my $cMan = $self->{cMan};
  $cMan->execute($sql);

  return $cMan->fetch();
  
}

=head3 findAll     

  my $rows = $baseDao->findAll();  

Find all rows. 

=cut

sub join_fields {
  my ($cid,$colm) = @_;	
  return $cid . ", " . join(", ",keys(%$colm));
}


1;
