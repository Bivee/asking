package Asking::Service::Authentication;
use Mojo::Base 'Asking::Service::Base';

use Asking::Schema;

sub load_user {
    my ($class, $app, $uid) = @_;
    return Asking::Schema->init_db->resultset('User')
        ->find($uid);
}

# validate user
sub validate_user {
    my ($class, $app, $username, $password, $extas) = @_;

    my $user = Asking::Schema->init_db->resultset('User')
        ->find({ email => $username, password => $password });

    # user found
    return $user->id if $user;
}

1;
