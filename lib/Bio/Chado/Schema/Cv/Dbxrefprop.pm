package Bio::Chado::Schema::Cv::Dbxrefprop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::Dbxrefprop - Metadata about a dbxref. Note that this is not defined in the dbxref module, as it depends on the cvterm table. This table has a structure analagous to cvtermprop.

=cut

__PACKAGE__->table("dbxrefprop");

=head1 ACCESSORS

=head2 dbxrefprop_id

  data_type: integer
  default_value: nextval('dbxrefprop_dbxrefprop_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 dbxref_id

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
  default_value: ''::text
  is_nullable: 0
  size: undef

=head2 rank

  data_type: integer
  default_value: 0
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "dbxrefprop_id",
  {
    data_type => "integer",
    default_value => "nextval('dbxrefprop_dbxrefprop_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
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
    default_value => "''::text",
    is_nullable => 0,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("dbxrefprop_id");
__PACKAGE__->add_unique_constraint("dbxrefprop_c1", ["dbxref_id", "type_id", "rank"]);

=head1 RELATIONS

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

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:f4MKKWBWV5vRpbV0VuwmSw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
