
 use DBI;
 
 $dbh = DBI->connect('dbi:mysql:tpbasededatos','root','toor') or die "Connection Error: $DBI::errstr\n";
 
 $sql = "SELECT title, c.name, l.name FROM blogs b, categories c, languajes l WHERE b.category_id = c.id AND b.languaje_id = l.id LIMIT 0,25;";
 
 $sth = $dbh->prepare($sql);
 
 $sth->execute or die "SQL Error: $DBI::errstr\n";
 
 # BIND TABLE COLUMNS TO VARIABLES
 $sth->bind_columns(undef, \$title, \$cat, \$lang);

 # LOOP THROUGH RESULTS
 while($sth->fetch()) {
   print "$title, $cat, $lang\n";
 } 

 
 #while (@row = $sth->fetchrow_array) {
 #  print "@row\n";
 #} 
