package Asking::Controller::Account;
use Mojo::Base 'Asking::Controller::Base';

use DateTime;

sub signin {
    my $self = shift;

    if ( $self->is_post ) {
        my $email    = $self->param('email')     || undef;
        my $password = $self->param('password')  || undef;
        my $return   = $self->param('return_to') || undef;

        # check credentials
        if ( $self->authenticate( $email, $password ) ) {
            return $self->redirect_to($return || '/');
        }

        # error
        return $self->render( message =>
              { class => 'alert-danger', text => 'Email or pass is wrong!' }, );
    }

    return $self->render( message => undef, );
}

sub register {
    my $self = shift;

    if ( $self->is_post ) {
        my $name     = $self->param('name')     || undef;
        my $email    = $self->param('email')    || undef;
        my $password = $self->param('password') || undef;

        # check if exists
        my $user_rs = $self->schema('User');
        unless ( $user_rs->count( { email => $email, password => $password } ) )
        {
            my $user = $user_rs->create( {
                    name     => $name,
                    email    => $email,
                    password => $password,
                    created  => DateTime->now( time_zone => 'local' ),
                }
            );

            # error
            return $self->render(
                message => { class => 'alert-success', text => 'User has been created!' },
            ) if $user && $user->in_storage;
        }
        else {
            # error
            return $self->render(
                message => { class => 'alert-success', text => 'User already exists!' },
            );
        }

        # error
        return $self->render(
            message => { class => 'danger', text => 'Email or pass is wrong!' },
        );
    }

    return $self->render(message => undef);
}

sub signout {
    my $self = shift;
    $self->logout;

    return $self->redirect_to('/');
}

1;
