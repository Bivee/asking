package Asking;
use Mojo::Base 'Mojolicious';

use Asking::Routes;

sub startup {
    my $self = shift;

    # Router
    my $r = $self->routes;
    $r->namespaces( ['Asking::Controller'] );

    # Normal route to controller
    $r->any('/')->to('home#index');

    # configure custom routes
    Asking::Routes->load($r);

    $r->any('/:controller/:action/:id')
      ->to( controller => 'home', action => 'index', id => 0 );
}

1;
