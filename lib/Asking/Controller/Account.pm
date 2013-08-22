package Asking::Controller::Account;
use Mojo::Base 'Asking::Controller::Base';

# action /account
sub index { }

# action /account/signin or /signin
sub signin { }

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
