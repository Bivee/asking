use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

use FindBin;
use lib "$FindBin::Bin/../lib";

my $t = Test::Mojo->new('Asking');

subtest 'home url' => sub {
    $t->get_ok('/')->status_is(200);
};

# account
subtest 'acount urls' => sub {
    $t->get_ok('/login')->status_is(200);
    $t->get_ok('/register')->status_is(200);
};

# questions
subtest 'question urls' => sub {
    $t->get_ok('/tags')->status_is(200);
    $t->get_ok('/questions')->status_is(200);
    $t->get_ok('/categories')->status_is(200);
};

# ask a question
subtest 'ask url' => sub {
    $t->get_ok('/ask')->status_is(200);
};

done_testing();
