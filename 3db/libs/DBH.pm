package libs::DBH;
use strict;
use DBI;

sub new
{
    my $class = ref($_[0])||$_[0];
    my $self = {};
    return bless($self,$class);
}

sub connect
{
    my ($self, $host, $user, $pass) = @_;
    my $dbh = DBI->connect($host, $user, $pass);
    return $dbh;
}

sub select
{
    my ($self, $dbh, $statement, @data) = @_;
    our $sth = $dbh->prepare($statement);
    my $cut = $sth->execute(@data);
    our @result = {};
    our $index = 0;
    our @row = ();
    while(@row=$sth->fetchrow_array()){
        @result[$index] = @row[0]." ".@row[1];
        $index++;
    }
    $sth->finish();
    return @result;
}

sub insert
{
    my ($self, $dbh, $statement) = @_;
    my $result = $dbh->do($statement);
    return $result;
}

sub update
{
    my ($self, $dbh, $statement) = @_;
    my $result = $dbh->do($statement);
    return $result;
}

sub delete
{
    my ($self, $dbh, $statement) = @_;
    my $result = $dbh->do($statement);
    return $result;
}

1;