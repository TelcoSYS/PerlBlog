package PerlBlog::BlogCrud;
 
use strict;
use warnings;

use PerlUP::Tools;
use PerlUP::Tools qw(getInput getResponseYes);

use PerlBlog::BaseCrud;
use PerlBlog::BlogsDao;

our @ISA = qw(PerlBlog::BaseCrud);    # inherits from BaseDao

=head1 NAME
 
PerlBlog::BlogCrud - Create Read Update Delete 
 
  Permite operar con la entidad Blog.
 
=head2 Methods
 
=head3 new
 
Get an instance of LanguageCrud.
 
=cut
 
# The constructor of an object is called new() by convention.
 
sub new {
  my $class = shift;
    
  my $self = $class->SUPER::new( PerlBlog::BlogsDao->new );
  
  bless $self, $class;
  return $self;
}

=head3 create     

  $myCrud->create();  

Create a new row. 

=cut

sub create {
  my $self = shift;
  my $dao = $self->{dao};
  my $cShow = $dao->{cShow};
  my $row = {};
  
  print "Crear registro\n\n";
  newField ("Nombre del Blog", $row, 'title', 2) or return;
  newField ("ID de Categoria", $row, 'category_id', 1) or return;
  newField ("ID de Idioma", $row, 'languaje_id', 1) or return;

  print "Desea crear el Blog: $row->{title}\n";
  if (getResponseYes()) {
	printf "La operacion finalizo %s\n", ($dao->create($row))?"exitosamente.":"con errores" ;       
  } else {
    print "Operacion cancelada.\n";
  }
  
}



=head3 edit     

  $myCrud->edit();  

Edit a row. 

=cut

sub edit {
  my $self = shift;
  my $dao = $self->{dao};
  my $cShow = $dao->{cShow};
  
  print "Editar registro\n\n";
  print "Ingrese el ID del Blog: "; my $in = getInput();
  unless (is_unsigned $in) { print "Numero invalido...\n"; return;} 
  
  my $row = $dao->find ($in) ;
  unless (defined $row) { print "El ID ingresado no existe...\n"; return ; } 

  editField ("Blog", $row, 'title', 2) or return;
  editField ("Categoria", $row, 'category_id', 1) or return;
  editField ("Idioma", $row, 'languaje_id', 1) or return;
    
  printf "La operacion finalizo %s\n", ($dao->save($row))?"exitosamente.":"con errores" ;       
  
}


sub newField {
  my ($self,$name,$row,$key,$type) = @_;	
  
  print "$name: "; my $in = getInput();
  unless ($in) {
    print (($type==2)?"Nombre":"Numero" . " invalido...\n");  
    return 0; }
  
  if ($type==1 and not is_unsigned $in) {
    print "Numero invalido...\n";  
    return 0; }     
  
  $row->{$key} = $in;
  return 1;
    
}

sub editFiled {
  my ($self,$name,$row,$key,$type) = @_;	
  
  my $act = (defined $row->{$key})? " [$row->{$key}]":"";
  print "$name$act: "; my $in = getInput();
  
  return 1 unless ($in); # no change field.
  
  if ($type==1 and not is_unsigned $in) {
    print "Numero invalido...\n";  
    return 0; }     
  
  $row->{$key} = $in;
  return 1;  
}

=head1 AUTHOR
 
  Gabriel Cugliari <ccugli%palermo_edu>
  Joel Planes <jplanes%palermo_edu>
 
=cut
 
1;
