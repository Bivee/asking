package Asking::Controller::Profile;
use Mojo::Base 'Asking::Controller::Base';

sub index {
    my $self = shift;

    # data do template
    return $self->render(
        user => $self->schema('User')
            ->find( $self->param('id') || 0 )
    );
}


1;
