package Bio::Chado::Schema::Mage::BiomaterialTreatment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::BiomaterialTreatment - Link biomaterials to treatments. Treatments have an order of operations (rank), and associated measurements (unittype_id, value).

=cut

__PACKAGE__->table("biomaterial_treatment");

=head1 ACCESSORS

=head2 biomaterial_treatment_id

=head2 biomaterial_id

=head2 treatment_id

=head2 unittype_id

=head2 value

=head2 rank

=cut

__PACKAGE__->add_columns(
  "biomaterial_treatment_id",
  {
    data_type => "integer",
    default_value => "nextval('biomaterial_treatment_biomaterial_treatment_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "biomaterial_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "treatment_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "unittype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "value",
  { data_type => "real", default_value => undef, is_nullable => 1, size => 4 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("biomaterial_treatment_id");
__PACKAGE__->add_unique_constraint(
  "biomaterial_treatment_c1",
  ["biomaterial_id", "treatment_id"],
);

=head1 RELATIONS

=head2 biomaterial

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Biomaterial>

=cut

__PACKAGE__->belongs_to(
  "biomaterial",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "biomaterial_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 unittype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "unittype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "unittype_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 treatment

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Treatment>

=cut

__PACKAGE__->belongs_to(
  "treatment",
  "Bio::Chado::Schema::Mage::Treatment",
  { treatment_id => "treatment_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u1iWDr0zKCAXKFlEo+prqg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
