use utf8;
package Asking::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-08-24 13:02:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nbt8MktNnfOygLtFkSrQKg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

sub init_db {
    Asking::Schema->connect(
        'dbi:mysql:dbname=asking', 'root', 'test', { mysql_enable_utf8 => 1 }
    );
}

1;
