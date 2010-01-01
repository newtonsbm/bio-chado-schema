package Bio::Chado::Schema::Mage::Mageml;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Mageml - This table is for storing extra bits of MAGEml in a denormalized form. More normalization would require many more tables.

=cut

__PACKAGE__->table("mageml");

=head1 ACCESSORS

=head2 mageml_id

  data_type: integer
  default_value: nextval('mageml_mageml_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 mage_package

  data_type: text
  default_value: undef
  is_nullable: 0
  size: undef

=head2 mage_ml

  data_type: text
  default_value: undef
  is_nullable: 0
  size: undef

=cut

__PACKAGE__->add_columns(
  "mageml_id",
  {
    data_type => "integer",
    default_value => "nextval('mageml_mageml_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "mage_package",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "mage_ml",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("mageml_id");

=head1 RELATIONS

=head2 magedocumentations

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Magedocumentation>

=cut

__PACKAGE__->has_many(
  "magedocumentations",
  "Bio::Chado::Schema::Mage::Magedocumentation",
  { "foreign.mageml_id" => "self.mageml_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qq5e2TE2cTGSzrojRuQO+g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
