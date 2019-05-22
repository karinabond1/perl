use strict;
use libs::DBH;
use DBI;

=head
my $sqlObj = libs::Sql->new();
my @selectFields = ("name,","email");
my $fieldsAmount = scalar(@selectFields);
#print $fieldsAmount;
my $strFields = join(' ', @selectFields[0 .. $fieldsAmount]);
my $selectStr = $sqlObj->select($strFields, 'users', 'name', 'Kate');
print $selectStr."\n";
=cut

my $dbh = libs::DBH->new();

my $dbhConnection = $dbh->connect('dbi:mysql:host=127.0.0.1;database=user14;','user14','user14');

if($dbhConnection){
    print "Connected\n";
}

####SELECT####
my @selectFields = ("name,","email");
my $fieldsAmount = scalar(@selectFields);
my $strFields = join(' ', @selectFields[0 .. $fieldsAmount]);


my $querySelect = "SELECT name, email FROM users WHERE name = ?";
my @data = ("Kate");
our @select = $dbh->select($dbhConnection, $querySelect, @data);
print "SELECT\n";
for(my $i=0; $i<scalar(@select);$i++){
    print @select[$i]."\n";
}

###INSERT######
my $queryInsert = "INSERT INTO users (name,email) VALUES ('Bob','bobgmail.com')";
our $insert = $dbh->insert($dbhConnection, $queryInsert);
if($insert){
    print "Inserted\n";
}

###UPDATE######
my $queryUpdate = "UPDATE users SET email='katyexample.com' WHERE name='Kate'";
our $update = $dbh->update($dbhConnection, $queryUpdate);
if($update){
    print "UPDATED\n";
}

###DELETE######
my $queryDelete = "DELETE FROM users WHERE name='Bob'";
our $delete = $dbh->update($dbhConnection, $queryDelete);
if($delete){
    print "DELETED\n";
}









#my $dbh = DBI->connect('dbi:mysql:host=127.0.0.1;database=user14;','user14','user14');

#dbh->disconnect();
#$dbh->do('INSERT/UPDATE/DELETE');