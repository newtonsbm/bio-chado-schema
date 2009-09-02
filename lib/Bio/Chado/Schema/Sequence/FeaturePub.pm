package Bio::Chado::Schema::Sequence::FeaturePub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature_pub");
__PACKAGE__->add_columns(
  "feature_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_pub_feature_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "pub_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("feature_pub_id");
__PACKAGE__->add_unique_constraint("feature_pub_c1", ["feature_id", "pub_id"]);
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);
__PACKAGE__->has_many(
  "feature_pubprops",
  "Bio::Chado::Schema::Sequence::FeaturePubprop",
  { "foreign.feature_pub_id" => "self.feature_pub_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WFIptjMNpjtn8nqnx5Cvgw


# You can replace this text with custom content, and it will be preserved on regeneration
1;