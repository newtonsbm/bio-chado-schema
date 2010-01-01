package Bio::Chado::Schema::Cv::Cvtermpath;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::Cvtermpath - The reflexive transitive closure of
the cvterm_relationship relation.

=cut

__PACKAGE__->table("cvtermpath");

=head1 ACCESSORS

=head2 cvtermpath_id

  data_type: integer
  default_value: nextval('cvtermpath_cvtermpath_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1
  size: 4

The relationship type that
this is a closure over. If null, then this is a closure over ALL
relationship types. If non-null, then this references a relationship
cvterm - note that the closure will apply to both this relationship
AND the OBO_REL:is_a (subclass) relationship.

=head2 subject_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 object_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 cv_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

Closures will mostly be within
one cv. If the closure of a relationship traverses a cv, then this
refers to the cv of the object_id cvterm.

=head2 pathdistance

  data_type: integer
  default_value: undef
  is_nullable: 1
  size: 4

The number of steps
required to get from the subject cvterm to the object cvterm, counting
from zero (reflexive relationship).

=cut

__PACKAGE__->add_columns(
  "cvtermpath_id",
  {
    data_type => "integer",
    default_value => "nextval('cvtermpath_cvtermpath_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "subject_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "object_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "cv_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "pathdistance",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);
__PACKAGE__->set_primary_key("cvtermpath_id");
__PACKAGE__->add_unique_constraint(
  "cvtermpath_c1",
  ["subject_id", "object_id", "type_id", "pathdistance"],
);

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 object

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 subject

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "subject_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cv

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cv>

=cut

__PACKAGE__->belongs_to(
  "cv",
  "Bio::Chado::Schema::Cv::Cv",
  { cv_id => "cv_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6ISyFcZj1n/akEpt/Bniew


# You can replace this text with custom content, and it will be preserved on regeneration
1;
