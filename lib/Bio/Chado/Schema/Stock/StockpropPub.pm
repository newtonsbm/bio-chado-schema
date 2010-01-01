package Bio::Chado::Schema::Stock::StockpropPub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Stock::StockpropPub - Provenance. Any stockprop assignment can optionally be supported by a publication.

=cut

__PACKAGE__->table("stockprop_pub");

=head1 ACCESSORS

=head2 stockprop_pub_id

=head2 stockprop_id

=head2 pub_id

=cut

__PACKAGE__->add_columns(
  "stockprop_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('stockprop_pub_stockprop_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "stockprop_id",
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
__PACKAGE__->set_primary_key("stockprop_pub_id");
__PACKAGE__->add_unique_constraint("stockprop_pub_c1", ["stockprop_id", "pub_id"]);

=head1 RELATIONS

=head2 pub

Type: belongs_to

Related object: L<Bio::Chado::Schema::Pub::Pub>

=cut

__PACKAGE__->belongs_to(
  "pub",
  "Bio::Chado::Schema::Pub::Pub",
  { pub_id => "pub_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stockprop

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stockprop>

=cut

__PACKAGE__->belongs_to(
  "stockprop",
  "Bio::Chado::Schema::Stock::Stockprop",
  { stockprop_id => "stockprop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OK04VWFE+FmQhc9Wab+32A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
