package Asking::Routes;
use Mojo::Base -strict;

sub load {
    my ( $class, $route ) = @_;

    # error
    die "error with route instance!\n"
      unless $route && $route->isa('Mojolicious::Routes');

    # default route to controller
    $route->get('/')->to('Home#index');

    # account routes
    $route->any('/login')->to( controller => 'Account', action => 'signin' );
    $route->any('/logout')->to( controller => 'Account', action => 'signout' );
    $route->any('/register')
      ->to( controller => 'Account', action => 'register' );

    # profile routes
    $route->any('/profile')->over( authenticated => 1 )
      ->to( controller => 'Profile', action => 'index' );

    # question routes
    $route->any('/question/:id/:slug')#->over( authenticated => 1 )
      ->to( controller => 'Question', action => 'index', id => 0, slug => undef );
    $route->any('/question/:id/vote/add')->over( authenticated => 1 )
      ->to( controller => 'Question', action => 'vote_add', id => 0 );
    $route->any('/question/:id/vote/remove')->over( authenticated => 1 )
      ->to( controller => 'Question', action => 'vote_remove', id => 0 );
    $route->any('/questions')#->over( authenticated => 1 )
      ->to( controller => 'Question', action => 'list' );

    # tags routes
    $route->any('/tags')#->over( authenticated => 1 )
      ->to( controller => 'Tag', action => 'list' );

    # categories routes
    $route->any('/categories')#->over( authenticated => 1 )
      ->to( controller => 'Category', action => 'list' );

    # ask routes
    $route->any('/ask')#->over( authenticated => 1 )
      ->to( controller => 'Question', action => 'create' );

    # really!?
    #$route->any('/:controller/:action/:id')
    #  ->to( controller => 'Home', action => 'index', id => 0 );

    return $route;
}
1;
