package MyAPP;
use Mojo::Base 'Mojolicious';

use MyAPP::Routes;

sub startup {
    my $self = shift;

    # Router
    my $r = $self->routes;
    $r->namespaces( ['MyAPP::Controller'] );

    # Normal route to controller
    $r->any('/')->to('home#index');

    # configure custom routes
    MyAPP::Routes->load($r);

    $r->any('/:controller/:action/:id')
      ->to( controller => 'home', action => 'index', id => 0 );
}

1;
