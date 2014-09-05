package Asking::String;
use Mojo::Base -base;

use Exporter 'import';
use Text::Unaccent::PurePerl;

# exported subs
our @EXPORT_OK = qw[string];

has 'value' => undef;

sub string {
    my $str = shift;
    return __PACKAGE__->new( value => $str );
}

# remove accents
sub unaccent {
    my ($self, $str) = @_;
    return unac_string($str || $self->value);
}

# without special chars, accent, lower and spaces
sub normalize {
    my ($self, $str) = @_;

    $str = $self->unaccent(lc($str || $self->value));
    $str =~ s/[\W]+//g;

    return $str;
}

# remove special chars, accent, lower and spaces to dash
sub slug {
    my ($self, $str) = @_;

    $str = $self->unaccent(lc($str || $self->value));
    $str =~ s/[\W]+/-/g;

    return $str;
}

1;
