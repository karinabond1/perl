use Data::Dumper;
use strict;
print "Hello\n";
print $@."\n";
print $!."\n";
my @arr = (1,2,3);
map{print "$_\n"}@arr;
my @arr1 = qw (1,2,3,4,5,"hhh");
my $var1 = @arr1;
my ($var2) = @arr1;
print "1: ".$var1."\n";
print "2: ".$var2."\n";
print Dumper(\@arr1);
no strict;
#my $a=1;
#=head
eval{
	 $a=15/0;
};
if($a){
	print $a."\n";
} else {
	print "Else\n";
}
#=cut

