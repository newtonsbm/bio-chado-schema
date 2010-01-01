package Bio::Chado::Schema::Stock::Stock;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Stock::Stock - Any stock can be globally identified by the
combination of organism, uniquename and stock type. A stock is the physical entities, either living or preserved, held by collections. Stocks belong to a collection; they have IDs, type, organism, description and may have a genotype.

=cut

__PACKAGE__->table("stock");

=head1 ACCESSORS

=head2 stock_id

=head2 dbxref_id

The dbxref_id is an optional primary stable identifier for this stock. Secondary indentifiers and external dbxrefs go in table: stock_dbxref.

=head2 organism_id

The organism_id is the organism to which the stock belongs. This column is mandatory.

=head2 name

The name is a human-readable local name for a stock.

=head2 uniquename

=head2 description

The description is the genetic description provided in the stock list.

=head2 type_id

The type_id foreign key links to a controlled vocabulary of stock types. The would include living stock, genomic DNA, preserved specimen. Secondary cvterms for stocks would go in stock_cvterm.

=head2 is_obsolete

=cut

__PACKAGE__->add_columns(
  "stock_id",
  {
    data_type => "integer",
    default_value => "nextval('stock_stock_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "organism_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_obsolete",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
);
__PACKAGE__->set_primary_key("stock_id");
__PACKAGE__->add_unique_constraint("stock_c1", ["organism_id", "uniquename", "type_id"]);

=head1 RELATIONS

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
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

=head2 organism

Type: belongs_to

Related object: L<Bio::Chado::Schema::Organism::Organism>

=cut

__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stockcollection_stocks

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockcollectionStock>

=cut

__PACKAGE__->has_many(
  "stockcollection_stocks",
  "Bio::Chado::Schema::Stock::StockcollectionStock",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockCvterm>

=cut

__PACKAGE__->has_many(
  "stock_cvterms",
  "Bio::Chado::Schema::Stock::StockCvterm",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockDbxref>

=cut

__PACKAGE__->has_many(
  "stock_dbxrefs",
  "Bio::Chado::Schema::Stock::StockDbxref",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_genotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockGenotype>

=cut

__PACKAGE__->has_many(
  "stock_genotypes",
  "Bio::Chado::Schema::Stock::StockGenotype",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stockprops

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::Stockprop>

=cut

__PACKAGE__->has_many(
  "stockprops",
  "Bio::Chado::Schema::Stock::Stockprop",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockPub>

=cut

__PACKAGE__->has_many(
  "stock_pubs",
  "Bio::Chado::Schema::Stock::StockPub",
  { "foreign.stock_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_relationship_subject_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockRelationship>

=cut

__PACKAGE__->has_many(
  "stock_relationship_subject_ids",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "foreign.subject_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stock_relationship_object_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Stock::StockRelationship>

=cut

__PACKAGE__->has_many(
  "stock_relationship_object_ids",
  "Bio::Chado::Schema::Stock::StockRelationship",
  { "foreign.object_id" => "self.stock_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NXCZqB+vAL3rxsbd29T1OA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
