package PerlBlog::MainMenu;
 
use strict;
use warnings;

use PerlUP::Tools;
use PerlUP::Tools 'getInput';

use PerlBlog::BlogCrud;
use PerlBlog::LanguageCrud;
use PerlBlog::CategoryCrud;

# No export function

=head1 NAME
 
PerlBlog::MainMenu - Main menu of PerlBlog 
 
  Menu principal de PerlBlog
 
=head2 Methods
 
=head3 showMenu
 
=cut
 
sub showMenu {
	
  print "\n PerlBlog\n";
  print " ========\n";	
  my $loop = 1;
  do {
    print "\n";
    print "\t(1) Adminitracion de Blogs\n";
    print "\t(2) Adminitracion de Categorias\n";
    print "\t(3) Adminitracion de Idiomas\n";
    print "\t(0) Salir\n:";
    my $in = getInput();
    if (is_unsigned $in) { #avoid error on text input
    SWITCH: {
      $in == 1 && do { PerlBlog::BlogCrud->new->showMenu(); last SWITCH; };
      $in == 2 && do { PerlBlog::CategoryCrud->new->showMenu(); last SWITCH; };
      $in == 3 && do { PerlBlog::LanguageCrud->new->showMenu(); last SWITCH; };
      $in == 0 && do { $loop = 0; last SWITCH; };
    }}
  } while ($loop);
  print "Gracias por usar PerlBlog\n";
}


=head3 create     

  $myCrud->create();  

Create a new row. 

=cut

sub create {
  my $self = shift;
  my $dao = $self->{dao};
  my $cShow = $dao->{cShow};
  
  print "Nombre del $dao->{cShow}->{entity}: ";
  my $in = trim(getInput());
  if ($in) {
    print "Desea crear el $cShow->{entity}: $in\n";
      if (getResponseYes()) {
		printf "La operacion finalizo %s\n", ($dao->create($in))?"exitosamente.":"con errores" ;       
      } else {
        print "Operacion cancelada.\n";
      }
  } else {
	  print "Nombre invalido...\n";
  }
}


=head3 list     

  $myCrud->list();  

List all rows. 

=cut

sub list {

  my $self = shift;
  my $dao = $self->{dao};
  my $cid = $dao->{cShow}->{id};
  my $cdesc = $dao->{cShow}->{desc};
  
  my $rows = $dao->findAll;
  
  print "Listar tabla\n\n";
  print "\t  ID\t$dao->{cShow}->{entity}\n";
  print "\t====\t======================\n";

  for my $row (@$rows) {
    printf "\t%4s\t%-s\n", $row->{$cid}, $row->{$cdesc};
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
  print "Ingrese el ID del $dao->{cShow}->{entity}: ";
  my $in = getInput();
  if (is_unsigned $in) {
    my $row = $dao->find ($in) ;
    if (defined $row) {	  
      print "\n$cShow->{entity} [$row->{$cShow->{desc}}]: ";
      if ($in = trim(getInput())) {
		$row->{$cShow->{desc}} = $in;
		printf "La operacion finalizo %s\n", ($dao->save($row))?"exitosamente.":"con errores" ;       
      } else {
        print "No se realizaron cambios.\n";
      }
    } else {
	  print "El ID ingresado no existe...\n";
    }
  } else {
	  print "Numero de ID invalido...\n";
  }
}

=head3 delete     

  $myCrud->delete();  

Delete a row. 

=cut

sub delete {
  my $self = shift;
  my $dao = $self->{dao};
  my $cShow = $dao->{cShow};
  
  print "Borrar registro\n\n";
  print "Ingrese el ID del $dao->{cShow}->{entity}: ";
  my $in = getInput();
  if (is_unsigned $in) {
    my $row = $dao->find ($in) ;
    if (defined $row) {	  
      print "Desea borrar el $cShow->{entity}\n\t$row->{$cShow->{id}} => $row->{$cShow->{desc}}\n";
      if (getResponseYes()) {
		printf "La operacion finalizo %s\n", ($dao->delete($in))?"exitosamente.":"con errores" ;       
      } else {
        print "Operacion cancelada.\n";
      }
    } else {
	  print "El ID ingresado no existe...\n";
    }
  } else {
	  print "Numero de ID invalido...\n";
  }
}




=head1 AUTHOR
 
  Gabriel Cugliari <ccugli%palermo_edu>
  Joel Planes <jplanes%palermo_edu>
 
=cut
 
1;
