use utf8;
package Asking::Schema::Result::Question;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Asking::Schema::Result::Question

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

=head1 TABLE: C<question>

=cut

__PACKAGE__->table("question");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 80

=head2 content

  data_type: 'varchar'
  is_nullable: 0
  size: 300

=head2 closed

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 votes

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 answers

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 viewed

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
  "user_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 80 },
  "content",
  { data_type => "varchar", is_nullable => 0, size => 300 },
  "closed",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "votes",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "answers",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "viewed",
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

=head2 question_answers

Type: has_many

Related object: L<Asking::Schema::Result::QuestionAnswer>

=cut

__PACKAGE__->has_many(
  "question_answers",
  "Asking::Schema::Result::QuestionAnswer",
  { "foreign.question_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 question_categories

Type: has_many

Related object: L<Asking::Schema::Result::QuestionCategory>

=cut

__PACKAGE__->has_many(
  "question_categories",
  "Asking::Schema::Result::QuestionCategory",
  { "foreign.question_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 question_tags

Type: has_many

Related object: L<Asking::Schema::Result::QuestionTag>

=cut

__PACKAGE__->has_many(
  "question_tags",
  "Asking::Schema::Result::QuestionTag",
  { "foreign.question_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user

Type: belongs_to

Related object: L<Asking::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Asking::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-08-25 21:15:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sx4KW7hkOzgY8CYszhuxUA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
