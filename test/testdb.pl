#!/usr/local/bin/perl

 
use strict;
use warnings;

use lib "/home/cgc/Escritorio/PerlBlog/lib";

use Data::Dumper;
use PerlBlog::ConnectionManager;


my $cMan = PerlBlog::ConnectionManager->new;

$cMan->openConnection();

my $sql = "SELECT * FROM blogs LIMIT 0,25;";

$cMan->execute($sql);

my $row = $cMan->fetch();


print Dumper($row);

$row = $cMan->fetch();
print Dumper($row);


