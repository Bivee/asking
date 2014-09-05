package Asking::Model::Base;
use Mojo::Base 'ObjectDB';

use DBI;

sub init_db {
    my $dbh = DBI->connect('dbi:SQLite:dbname=database.db', undef, undef, {})
        or die "[ERROR] Database connection error: $!\n";

    return $dbh;
}

1;
