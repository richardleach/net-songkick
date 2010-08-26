package Net::Songkick::Location;

use strict;
use warnings;

use Moose;

has $_ => (
    is => 'ro',
    isa => 'Str',
) for qw[lng lat city];

sub new_from_xml {
    my $class = shift;
    my ($xml) = @_;

    my $self = {};

    foreach (qw[lng lat city]) {
        $self->{$_} = $xml->findvalue("\@$_");
    }

    return $class->new($self);
}

1;
