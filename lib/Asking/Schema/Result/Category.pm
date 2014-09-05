use utf8;
package Asking::Schema::Result::Category;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Asking::Schema::Result::Category

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<category>

=cut

__PACKAGE__->table("category");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 60

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 140

=head2 slug

  data_type: 'varchar'
  is_nullable: 0
  size: 60

=head2 questions

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 created

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 60 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 140 },
  "slug",
  { data_type => "varchar", is_nullable => 0, size => 60 },
  "questions",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "created",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 question_categories

Type: has_many

Related object: L<Asking::Schema::Result::QuestionCategory>

=cut

__PACKAGE__->has_many(
  "question_categories",
  "Asking::Schema::Result::QuestionCategory",
  { "foreign.category_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-08-25 21:15:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Azz6NXG6oogOkMMlVrKfcw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
