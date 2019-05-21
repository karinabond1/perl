package Utilities::myPackage;

use strict;
use Data::Dumper;

sub new
{
=head
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    return bless($self, $class);
=cut
    return bless({}, ref($_[0])||$_[0]);
}



sub foo
{
    my($self,$a,$b) = @_;
    $self->bar();
    return $a*2;
}
sub bar
{
    my($self)=@_;
}
#############################
sub _foo
{

}

my $foo2 = sub{
    my($self)=@_;
};


sub DESTROY
{

}

1;# or return 1;