package Bio::Chado::Schema::Phylogeny::PhylonodePub;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Phylogeny::PhylonodePub

=cut

__PACKAGE__->table("phylonode_pub");

=head1 ACCESSORS

=head2 phylonode_pub_id

  data_type: integer
  default_value: nextval('phylonode_pub_phylonode_pub_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0
  size: 4

=head2 phylonode_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=head2 pub_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0
  size: 4

=cut

__PACKAGE__->add_columns(
  "phylonode_pub_id",
  {
    data_type => "integer",
    default_value => "nextval('phylonode_pub_phylonode_pub_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "phylonode_id",
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
__PACKAGE__->set_primary_key("phylonode_pub_id");
__PACKAGE__->add_unique_constraint("phylonode_pub_phylonode_id_key", ["phylonode_id", "pub_id"]);

=head1 RELATIONS

=head2 phylonode

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylonode>

=cut

__PACKAGE__->belongs_to(
  "phylonode",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "phylonode_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:45:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9XkFUf6FXVtcUNO8KFNxAA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
