package Bio::Chado::Schema::Phenotype::PhenotypeCvterm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Phenotype::PhenotypeCvterm

=cut

__PACKAGE__->table("phenotype_cvterm");

=head1 ACCESSORS

=head2 phenotype_cvterm_id

=head2 phenotype_id

=head2 cvterm_id

=head2 rank

=cut

__PACKAGE__->add_columns(
  "phenotype_cvterm_id",
  {
    data_type => "integer",
    default_value => "nextval('phenotype_cvterm_phenotype_cvterm_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "phenotype_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "cvterm_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("phenotype_cvterm_id");
__PACKAGE__->add_unique_constraint("phenotype_cvterm_c1", ["phenotype_id", "cvterm_id", "rank"]);

=head1 RELATIONS

=head2 phenotype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phenotype::Phenotype>

=cut

__PACKAGE__->belongs_to(
  "phenotype",
  "Bio::Chado::Schema::Phenotype::Phenotype",
  { phenotype_id => "phenotype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cvterm

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "cvterm",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "cvterm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iNYP9XUqK2PbGAYYs0Xbig


# You can replace this text with custom content, and it will be preserved on regeneration
1;
