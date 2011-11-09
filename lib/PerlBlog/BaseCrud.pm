package PerlBlog::BaseCrud;
 
use strict;
use warnings;

use PerlUP::Tools;


=head1 NAME
 
PerlBlog::BaseCrud - Create Read Update Delete 
 
  Permite operar con los datos.
 
=head2 Methods
 
=head3 new
 
Get an instance of BaseCrud.
 
=cut
 
# The constructor of an object is called new() by convention.
 
sub new {
  my ($class, $entity, $dao) = @_;
   
  my $self = { entity => $entity, dao => $dao };
    
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

=head3 delete     

  $myCrud->delete();  

Delete a row. 

=cut

sub delete {
  my $self = shift;
  my $dao = $self->{dao};
  
  print "Ingrese el ID del $self->{entity}: ";
  my $in = <STDIN> ; chomp $in;
  if (is_unsigned $in) {
    my $row = $dao->find ($in) ;
    if (defined $row) {	  
      print "Desea borrar el $self->{entity}\n\t$row->{id} => $row->{name}\n(yes|no)?:";
      
    } else {
	  print "El ID ingresado no existe...\n";
    }
  } else {
	  print "Número de ID invalido...\n";
  }
  
  
}




=head1 AUTHOR
 
  Gabriel Cugliari <ccugli%palermo_edu>
  Joel Planes <jplanes%palermo_edu>
 
=cut
 
1;
