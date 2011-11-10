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
  
  print "Nombre del Blog: "; my $in = trim(getInput());
  unless ($in) { print "Nombre invalido...\n"; return; } 
  $row->{title} = $in;
  
  print "ID de Categoria: "; $in = trim(getInput());
  unless (is_unsigned $in) { print "Numero invalido...\n"; return; }
  $row->{category_id} = $in;

  print "ID de Idioma: "; $in = trim(getInput());
  unless (is_unsigned $in) { print "Numero invalido...\n"; return; }
  $row->{languaje_id} = $in;

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
  
  print "Blog [$row->{title}]: "; $in = trim(getInput());
  unless ($in) { print "Nombre invalido...\n"; return; } 
  $row->{title} = $in;
  
  print "Categoria [$row->{category_id}]: "; $in = trim(getInput());
  unless (is_unsigned $in) { print "Numero invalido...\n"; return; } 
  $row->{category_id} = $in;

  print "Idioma [$row->{languaje_id}]: "; $in = trim(getInput());
  unless (is_unsigned $in) { print "Numero invalido...\n"; return; }
  $row->{languaje_id} = $in;

  printf "La operacion finalizo %s\n", ($dao->save($row))?"exitosamente.":"con errores" ;       
  
}


=head1 AUTHOR
 
  Gabriel Cugliari <ccugli%palermo_edu>
  Joel Planes <jplanes%palermo_edu>
 
=cut
 
1;
