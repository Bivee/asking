package Asking;
use Mojo::Base 'Mojolicious';

use Asking::Routes;
use Asking::Schema;
use Asking::String qw[string];
use Asking::Service;

sub startup {
    my $self = shift;

    # schema helper
    $self->helper(
        schema => sub {
            return Asking::Schema->init_db->resultset($_[1]) if $_[1];
            return Asking::Schema->init_db;
        }
    );

    $self->helper(
        string => sub {
            return string($_[1]) if $_[1];
            return Asking::String->new;
        }
    );

    # load auth plugin
    $self->plugin(
        'authentication' => {
            'autoload_user' => 1,
            'session_key'   => 'uid',
            'load_user'     => sub {
                my $service = Asking::Service->load('Authentication');
                return $service->load_user(@_);
            },
            'validate_user' => sub {
                my $service = Asking::Service->load("Authentication");
                return $service->validate_user(@_);
            },
        }
    );

    # Router
    my $r = $self->routes;
    $r->namespaces(['Asking::Controller']);

    # config all routes
    Asking::Routes->load($r);
}

1;
