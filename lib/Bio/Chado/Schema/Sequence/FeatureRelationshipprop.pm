package Bio::Chado::Schema::Sequence::FeatureRelationshipprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::FeatureRelationshipprop - Extensible properties
for feature_relationships. Analagous structure to featureprop. This
table is largely optional and not used with a high frequency. Typical
scenarios may be if one wishes to attach additional data to a
feature_relationship - for example to say that the
feature_relationship is only true in certain contexts.

=cut

__PACKAGE__->table("feature_relationshipprop");

=head1 ACCESSORS

=head2 feature_relationshipprop_id

=head2 feature_relationship_id

=head2 type_id

The name of the
property/slot is a cvterm. The meaning of the property is defined in
that cvterm. Currently there is no standard ontology for
feature_relationship property types.

=head2 value

The value of the
property, represented as text. Numeric values are converted to their
text representation. This is less efficient than using native database
types, but is easier to query.

=head2 rank

Property-Value
ordering. Any feature_relationship can have multiple values for any particular
property type - these are ordered in a list using rank, counting from
zero. For properties that are single-valued rather than multi-valued,
the default 0 value should be used.

=cut

__PACKAGE__->add_columns(
  "feature_relationshipprop_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_relationshipprop_feature_relationshipprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_relationship_id",
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
__PACKAGE__->set_primary_key("feature_relationshipprop_id");
__PACKAGE__->add_unique_constraint(
  "feature_relationshipprop_c1",
  ["feature_relationship_id", "type_id", "rank"],
);

=head1 RELATIONS

=head2 feature_relationship

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::FeatureRelationship>

=cut

__PACKAGE__->belongs_to(
  "feature_relationship",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "feature_relationship_id" => "feature_relationship_id" },
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

=head2 feature_relationshipprop_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureRelationshippropPub>

=cut

__PACKAGE__->has_many(
  "feature_relationshipprop_pubs",
  "Bio::Chado::Schema::Sequence::FeatureRelationshippropPub",
  {
    "foreign.feature_relationshipprop_id" => "self.feature_relationshipprop_id",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jZ9p5i3StdKmWKivAadzbw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
