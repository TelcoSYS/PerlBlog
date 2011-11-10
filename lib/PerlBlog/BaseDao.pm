package PerlBlog::BaseDao;
 
use strict;
use warnings;

use PerlBlog::ConnectionManager;
use PerlUP::Tools;

use Data::Dumper;

=head1 NAME
 
PerlBlog::BaseDao - Capa para acceder a los datos.
 
=head1 SYNOPSIS

    use PerlBlog::BaseDao;
	my $baseDao = PerlBlog::BaseDao->new();
 
=head1 DESCRIPTION
 
  Permite acceder a los datos guardas en la base de datos MySQL.
 
=head2 Methods
 
=head3 new
 
    my $dao = PerlBlog::BaseDao->new();
 
Get an instance of BaseDao.
 
=cut
 
# The constructor of an object is called new() by convention.
 
sub new {
  my ($class, $table, $cid, $colm) = @_;
   
  my $cMan = PerlBlog::ConnectionManager->new();
  my $self = {cMan => $cMan, table => $table, cid => $cid, colm => $colm, limit => 50 };
    
  $self = bless ($self, $class);  
 
  return $self;
}


=head3 find
 
    my $row = $dao->find($rid); 
 
Find a row by ID.
 
=cut

sub find {
  my ($self,$id) = @_;
  
  return undef unless is_unsigned ($id);
  
  my $cid = $self->{cid};
  my $colm = $self->{colm};
  
  my $sql = "SELECT " . join_fields($cid,$colm) . " FROM $self->{table} WHERE $cid = $id ;" ;
  
  my $cMan = $self->{cMan};
  $cMan->execute($sql);

  return $cMan->fetch();
  
}

=head3 findAll     

  my $rows = $dao->findAll();  

Find all rows. 

=cut

sub findAll {
  my $self = shift;
  
  my $cid = $self->{cid};
  my $colm = $self->{colm};
  
  my $sql = "SELECT " . join_fields($cid,$colm) . " FROM $self->{table} LIMIT 0,$self->{limit} ;" ;
  
  my $cMan = $self->{cMan};
  $cMan->execute($sql);

  my $array = []; my $row;
  
  while ($row=$cMan->fetch) {
	  push (@$array,$row);
  }
  
  return $array;
  
}


=head3 create     

  $dao->create($name);  

Delete a row. 

=cut

sub create {
  my ($self,$desc) = @_;
   
  my $sql = "INSERT INTO $self->{table} ($self->{cShow}->{desc}) VALUES ('$desc');" ;
  
  return $self->{cMan}->update($sql);
}

=head3 save     

  $dao->save($name);  

Save a row. 

=cut

sub save {
  my ($self,$row) = @_;
   
  my $sql = "UPDATE $self->{table} SET ";
  my $fld = $self->{colm}; 
  my $coma = 0; my $quote ;
  for my $key (keys(%$fld)) {
	  $quote = ($fld->{$key} == 2)? "'":"" ;
	  $sql .= (($coma)?", ":"") . "$key = $quote$row->{$key}$quote ";
	  $coma = 1;
  }
  $sql .= " WHERE $self->{cid} = $row->{$self->{cid}};" ;
     
  return $self->{cMan}->update($sql);
}

=head3 delete     

  $dao->delete($id);  

Delete a row. 

=cut

sub delete {
  my ($self,$id) = @_;
   
  my $sql = "DELETE FROM $self->{table} WHERE $self->{cid} = $id ;" ;
  
  return $self->{cMan}->update($sql);
  
}

sub join_fields {
  my ($cid,$colm) = @_;	
  return $cid . ", " . join(", ",keys(%$colm));
}

=head1 AUTHOR
 
  Gabriel Cugliari <ccugli%palermo_edu>
  Joel Planes <jplanes%palermo_edu>
 
=cut
 
1;
