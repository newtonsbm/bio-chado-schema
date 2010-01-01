package Bio::Chado::Schema::Mage::Studyprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Studyprop

=cut

__PACKAGE__->table("studyprop");

=head1 ACCESSORS

=head2 studyprop_id

  data_type: integer
  default_value: nextval('studyprop_studyprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 study_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 value

  data_type: text
  default_value: undef
  is_nullable: 1
  size: undef

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "studyprop_id",
  {
    data_type => "integer",
    default_value => "nextval('studyprop_studyprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "study_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("studyprop_id");
__PACKAGE__->add_unique_constraint("studyprop_study_id_key", ["study_id", "type_id", "rank"]);

=head1 RELATIONS

=head2 study

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Study>

=cut

__PACKAGE__->belongs_to(
  "study",
  "Bio::Chado::Schema::Mage::Study",
  { study_id => "study_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 studyprop_features

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::StudypropFeature>

=cut

__PACKAGE__->has_many(
  "studyprop_features",
  "Bio::Chado::Schema::Mage::StudypropFeature",
  { "foreign.studyprop_id" => "self.studyprop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KechBbEUtcvRS1UXfmTrUw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
