package MyAPP::Routes;
use Mojo::Base -strict;

sub load {
    my ( $class, $route ) = @_;

    # error
    die "error with route instance!\n"
      unless $route && $route->isa('Mojolicious::Routes');

    # custom routes
    my $custom = {
        #add custom route here
    };

    # add routes
    $route->any($_)->to( $custom->{$_} ) for keys %$custom;

    return $route;
}

1;

                                                                                                                                                                                            __END__

                                                                                                                                                                                            =pod

                                                                                                                                                                                            =head1 NAME

                                                                                                                                                                                            Site::Routes

                                                                                                                                                                                            =head1 DESCRIPTION

                                                                                                                                                                                            Classe responsável pela configuração de todas as rotas
                                                                                                                                                                                            customizadas da aplicação.

                                                                                                                                                                                            Utilize esta classe sempre que necessário adicionar uma
                                                                                                                                                                                            nova rota neste site.

                                                                                                                                                                                            =head1 SEE ALSO

                                                                                                                                                                                            L<Mojolicious>, L<Mojolicious::Routes>

                                                                                                                                                                                            =cut
