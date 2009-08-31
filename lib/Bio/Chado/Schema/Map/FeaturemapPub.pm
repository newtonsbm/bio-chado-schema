package Bio::Chado::Schema::Map::FeaturemapPub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featuremap_pub");
__PACKAGE__->add_columns(
  "featuremap_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('featuremap_pub_featuremap_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "featuremap_id",
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
__PACKAGE__->set_primary_key("featuremap_pub_id");
__PACKAGE__->belongs_to("pub", "Bio::Chado::Schema::Pub::Pub", { pub_id => "pub_id" });
__PACKAGE__->belongs_to(
  "featuremap",
  "Bio::Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X1elgXip3lpHzP4J1/mElg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
