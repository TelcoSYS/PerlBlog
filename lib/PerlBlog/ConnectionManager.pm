package PerlBlog::ConnectionManager;
 
use strict;
use warnings;
use DBI;
use PerlUP::Tools;

# Parametros de Conexion
use constant USERNAME => "tpperl";
use constant PASSWORD => "tpblog";
use constant HOSTNAME => "localhost";
use constant DBNAME => "tpbasededatos";

# Todas las instancias comparte la conexion a la base de datos 
my $dbh; 

 
=head1 NAME
 
PerlBlog::ConnectionManager - Manage connection to DataBase
 
=head1 SYNOPSIS

    use PerlBlog::ConnectionManager;
    my $cMan = PerlBlog::ConnectionManager->new();
	$cMan->openConnection();
	$cMan->execute($sql);
	%row = $cMan->fetch();
 
=head1 DESCRIPTION
 
  This is an object-oriented library which manage the connection to a MySQL DataBase.
 
=head2 Methods
 
=head3 new
 
    my $cMan = PerlBlog::ConnectionManager->new();
 
Get an instance of ConnectionManager.
 
=cut
 
# The constructor of an object is called new() by convention.
 
sub new {
  my $class = shift;
  
  my $self = bless ({error => 0}, $class);  
 
  return $self;
}
 
 
=head3 openConnection
 
    $cMan->openConnection();
 
Outputs the greeting to STDOUT
 
=cut
 
sub openConnection {
  #my $self = shift;
    if (not defined $dbh) {
      my $connection = join(":","dbi","mysql",DBNAME,HOSTNAME);
      $dbh = DBI->connect($connection,USERNAME,PASSWORD,{RaiseError => 0, PrintError=>0, AutoCommit=>1, mysql_enable_utf8 => 1});
      if (not defined $dbh) {	
        print "Fallo la conexion con la base de datos.\n"; exit (1); }
    }

    return $dbh;
}

=head3 execute
 
    $cMan->execute($sql);
 
Execute SQL sentence
 
=cut
 
sub execute {
  my ($self, $sql) = @_; my $sth;
  
  openConnection unless defined $dbh;
 
  if ($dbh and $sth = $dbh->prepare($sql) and $sth->execute) {
    $self->{sth} = $sth; 
    $self->{error} = 0;
  } else {
    $self->{sth} = undef; 
    $self->{error} = 4;	  
  }
  #return  $self->{error};	  
}

sub update {
  my ($self, $sql) = @_; my $sth;
  
  openConnection unless defined $dbh;
  
  return ($dbh and $sth = $dbh->prepare($sql) and is_positive ($sth->execute));
  # return false for 0 and 0E0
}

=head3 fetch
 
    my $row = $cMan->fetch();
 
Fetch next row
 
=cut
 
sub fetch {
  my $self = shift;
  
  my $sth = $self->{sth};

  return (defined $sth)? $sth->fetchrow_hashref:undef ;
}
 
=head1 AUTHOR
 
  Gabriel Cugliari <ccugli%palermo_edu>
  Joel Planes <jplanes%palermo_edu>
 
=cut
 
1;
