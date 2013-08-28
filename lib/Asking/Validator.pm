package Asking::Validator;
use Mojo::Base -strict;

sub load {
    my $class = shift;
    my %param = @_ if @_ % 2 == 0;

    my $ns = 'Asking::Validator';
    my $model = $param{model} || $_[0];

    if($model){
        # build require
        my $module_load = $ns;
        $module_load =~ s/::/\//g;

        require "${module_load}/${model}.pm";
        my $instance = "${ns}::${model}"->new;
        
        return $instance 
            if $instance && $instance->isa('Asking::Validator::Base');

        return undef;
    }
}

1;
