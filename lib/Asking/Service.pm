package Asking::Service;
use Mojo::Base -strict;

sub load {
    my ($self, $load) = @_;

    eval {
        require "Asking/Service/${load}.pm"; 
    };
    if($@){
        die "Error loading service: Asking::Service::$load $@\n";
    }

    my $ins = "Asking::Service::${load}"->new;
    return $ins 
        if $ins && $ins->isa('Asking::Service::Base');
}

1;
