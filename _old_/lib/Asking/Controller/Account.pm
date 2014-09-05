package Asking::Controller::Account;
use Mojo::Base 'Asking::Controller::Base';

use Asking::Model;
use Asking::Validator;

# action /account
sub index { }

# action /account/signin or /signin
sub signin {
    my $self = shift;

    my $message;
    
    if($self->is_post){
        my $email = $self->param('email') || undef;
        my $password = $self->param('password') || undef;
        
        my $model = Asking::Model->load('User');
        $model->column('email', $email);
        $model->column('password', $email);
        
        my $validator = Asking::Validator->load('User');
        if($validator->validate($model->to_hash)){
            $model = $model->find(
                where   => [email => $email, password => $password],
                single  => 1
            );

            # error
            unless($model->error){
                $message = 'Database error!';
            }

            # user found
            if($model){
                $self->session(
                    'user.uid' => $model->column('id') || 0
                    'user.name' => $model->column('name') || '',
                    'user.email' => $model->column('email') || ''
                );

                return $self->redirect_to('/profile');
            }
            else {
                # user not found
                $message = 'Email or password incorrect!';
            }
        }
        else {
            $message = $validator->error;
        }
    }

    return $self->render(message => $message);
}

# action /account/signup or /signup
sub signup { }

# action /account/signout or /signout
sub signout { }

# action /account/change/:token
sub change { }

# action /account/forgot or /forgot
sub forgot { }

# action /account/active/:token
sub active { }

# action /account/edit
sub edit { }

# action /account/avatar
sub avatar { }

1;
