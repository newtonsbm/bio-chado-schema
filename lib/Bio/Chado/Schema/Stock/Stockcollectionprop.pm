package Bio::Chado::Schema::Stock::Stockcollectionprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Stock::Stockcollectionprop - The table stockcollectionprop
contains the value of the stock collection such as website/email URLs;
the value of the stock collection order URLs.

=cut

__PACKAGE__->table("stockcollectionprop");

=head1 ACCESSORS

=head2 stockcollectionprop_id

=head2 stockcollection_id

=head2 type_id

The cv for the type_id is "stockcollection property type".

=head2 value

=head2 rank

=cut

__PACKAGE__->add_columns(
  "stockcollectionprop_id",
  {
    data_type => "integer",
    default_value => "nextval('stockcollectionprop_stockcollectionprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "stockcollection_id",
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
__PACKAGE__->set_primary_key("stockcollectionprop_id");
__PACKAGE__->add_unique_constraint(
  "stockcollectionprop_c1",
  ["stockcollection_id", "type_id", "rank"],
);

=head1 RELATIONS

=head2 stockcollection

Type: belongs_to

Related object: L<Bio::Chado::Schema::Stock::Stockcollection>

=cut

__PACKAGE__->belongs_to(
  "stockcollection",
  "Bio::Chado::Schema::Stock::Stockcollection",
  { stockcollection_id => "stockcollection_id" },
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


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DTUMynvXK71wwWoqZ62qBg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
