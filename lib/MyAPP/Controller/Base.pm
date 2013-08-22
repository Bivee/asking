package MyAPP::Controller::Base;
use Mojo::Base 'Mojolicious::Controller';

# true if http method is post
sub is_post {
    return (shift)->req->method eq 'POST' ? 1 : 0;
}

# wrapper to get http method
sub http_method {
    return (shift)->req->method;
}

1;

__END__
