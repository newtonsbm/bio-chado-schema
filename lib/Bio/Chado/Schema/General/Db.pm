package Bio::Chado::Schema::General::Db;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::General::Db - A database authority. Typical databases in
bioinformatics are FlyBase, GO, UniProt, NCBI, MGI, etc. The authority
is generally known by this shortened form, which is unique within the
bioinformatics and biomedical realm.  To Do - add support for URIs,
URNs (e.g. LSIDs). We can do this by treating the URL as a URI -
however, some applications may expect this to be resolvable - to be
decided.

=cut

__PACKAGE__->table("db");

=head1 ACCESSORS

=head2 db_id

=head2 name

=head2 description

=head2 urlprefix

=head2 url

=cut

__PACKAGE__->add_columns(
  "db_id",
  {
    data_type => "integer",
    default_value => "nextval('db_db_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "description",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "urlprefix",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "url",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("db_id");
__PACKAGE__->add_unique_constraint("db_c1", ["name"]);

=head1 RELATIONS

=head2 dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->has_many(
  "dbxrefs",
  "Bio::Chado::Schema::General::Dbxref",
  { "foreign.db_id" => "self.db_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SoNslOHuCoGvqOM71BVjmQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
