package Bio::Chado::Schema::Sequence::Feature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Sequence::Feature - A feature is a biological sequence or a
section of a biological sequence, or a collection of such
sections. Examples include genes, exons, transcripts, regulatory
regions, polypeptides, protein domains, chromosome sequences, sequence
variations, cross-genome match regions such as hits and HSPs and so
on; see the Sequence Ontology for more. The combination of
organism_id, uniquename and type_id should be unique.

=cut

__PACKAGE__->table("feature");

=head1 ACCESSORS

=head2 feature_id

=head2 dbxref_id

An optional primary public stable
identifier for this feature. Secondary identifiers and external
dbxrefs go in the table feature_dbxref.

=head2 organism_id

The organism to which this feature
belongs. This column is mandatory.

=head2 name

The optional human-readable common name for
a feature, for display purposes.

=head2 uniquename

The unique name for a feature; may
not be necessarily be particularly human-readable, although this is
preferred. This name must be unique for this type of feature within
this organism.

=head2 residues

A sequence of alphabetic characters
representing biological residues (nucleic acids, amino acids). This
column does not need to be manifested for all features; it is optional
for features such as exons where the residues can be derived from the
featureloc. It is recommended that the value for this column be
manifested for features which may may non-contiguous sublocations (e.g.
transcripts), since derivation at query time is non-trivial. For
expressed sequence, the DNA sequence should be used rather than the
RNA sequence. The default storage method for the residues column is
EXTERNAL, which will store it uncompressed to make substring operations
faster.

=head2 seqlen

The length of the residue feature. See
column:residues. This column is partially redundant with the residues
column, and also with featureloc. This column is required because the
location may be unknown and the residue sequence may not be
manifested, yet it may be desirable to store and query the length of
the feature. The seqlen should always be manifested where the length
of the sequence is known.

=head2 md5checksum

The 32-character checksum of the sequence,
calculated using the MD5 algorithm. This is practically guaranteed to
be unique for any feature. This column thus acts as a unique
identifier on the mathematical sequence.

=head2 type_id

A required reference to a table:cvterm
giving the feature type. This will typically be a Sequence Ontology
identifier. This column is thus used to subclass the feature table.

=head2 is_analysis

Boolean indicating whether this
feature is annotated or the result of an automated analysis. Analysis
results also use the companalysis module. Note that the dividing line
between analysis and annotation may be fuzzy, this should be determined on
a per-project basis in a consistent manner. One requirement is that
there should only be one non-analysis version of each wild-type gene
feature in a genome, whereas the same gene feature can be predicted
multiple times in different analyses.

=head2 is_obsolete

Boolean indicating whether this
feature has been obsoleted. Some chado instances may choose to simply
remove the feature altogether, others may choose to keep an obsolete
row in the table.

=head2 timeaccessioned

For handling object
accession or modification timestamps (as opposed to database auditing data,
handled elsewhere). The expectation is that these fields would be
available to software interacting with chado.

=head2 timelastmodified

For handling object
accession or modification timestamps (as opposed to database auditing data,
handled elsewhere). The expectation is that these fields would be
available to software interacting with chado.

=cut

__PACKAGE__->add_columns(
  "feature_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_feature_id_seq'::regclass)",
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
  "residues",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "seqlen",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "md5checksum",
  {
    data_type => "character",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_analysis",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "is_obsolete",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "timeaccessioned",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
  "timelastmodified",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("feature_id");
__PACKAGE__->add_unique_constraint("feature_c1", ["organism_id", "uniquename", "type_id"]);

=head1 RELATIONS

=head2 analysisfeatures

Type: has_many

Related object: L<Bio::Chado::Schema::Companalysis::Analysisfeature>

=cut

__PACKAGE__->has_many(
  "analysisfeatures",
  "Bio::Chado::Schema::Companalysis::Analysisfeature",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cell_line_features

Type: has_many

Related object: L<Bio::Chado::Schema::CellLine::CellLineFeature>

=cut

__PACKAGE__->has_many(
  "cell_line_features",
  "Bio::Chado::Schema::CellLine::CellLineFeature",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 elements

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Element>

=cut

__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.feature_id" => "self.feature_id" },
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

=head2 feature_cvterms

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureCvterm>

=cut

__PACKAGE__->has_many(
  "feature_cvterms",
  "Bio::Chado::Schema::Sequence::FeatureCvterm",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_dbxrefs

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureDbxref>

=cut

__PACKAGE__->has_many(
  "feature_dbxrefs",
  "Bio::Chado::Schema::Sequence::FeatureDbxref",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_expressions

Type: has_many

Related object: L<Bio::Chado::Schema::Expression::FeatureExpression>

=cut

__PACKAGE__->has_many(
  "feature_expressions",
  "Bio::Chado::Schema::Expression::FeatureExpression",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_genotype_feature_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::FeatureGenotype>

=cut

__PACKAGE__->has_many(
  "feature_genotype_feature_ids",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_genotype_chromosome_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Genetic::FeatureGenotype>

=cut

__PACKAGE__->has_many(
  "feature_genotype_chromosome_ids",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.chromosome_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featureloc_feature_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::Featureloc>

=cut

__PACKAGE__->has_many(
  "featureloc_feature_ids",
  "Bio::Chado::Schema::Sequence::Featureloc",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featureloc_srcfeature_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::Featureloc>

=cut

__PACKAGE__->has_many(
  "featureloc_srcfeature_ids",
  "Bio::Chado::Schema::Sequence::Featureloc",
  { "foreign.srcfeature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_phenotypes

Type: has_many

Related object: L<Bio::Chado::Schema::Phenotype::FeaturePhenotype>

=cut

__PACKAGE__->has_many(
  "feature_phenotypes",
  "Bio::Chado::Schema::Phenotype::FeaturePhenotype",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featurepos_feature_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurepos>

=cut

__PACKAGE__->has_many(
  "featurepos_feature_ids",
  "Bio::Chado::Schema::Map::Featurepos",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featurepos_map_feature_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurepos>

=cut

__PACKAGE__->has_many(
  "featurepos_map_feature_ids",
  "Bio::Chado::Schema::Map::Featurepos",
  { "foreign.map_feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featureprops

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::Featureprop>

=cut

__PACKAGE__->has_many(
  "featureprops",
  "Bio::Chado::Schema::Sequence::Featureprop",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_pubs

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeaturePub>

=cut

__PACKAGE__->has_many(
  "feature_pubs",
  "Bio::Chado::Schema::Sequence::FeaturePub",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featurerange_leftendf_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurerange>

=cut

__PACKAGE__->has_many(
  "featurerange_leftendf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.leftendf_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featurerange_rightstartf_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurerange>

=cut

__PACKAGE__->has_many(
  "featurerange_rightstartf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.rightstartf_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featurerange_rightendf_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurerange>

=cut

__PACKAGE__->has_many(
  "featurerange_rightendf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.rightendf_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featurerange_leftstartf_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurerange>

=cut

__PACKAGE__->has_many(
  "featurerange_leftstartf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.leftstartf_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 featurerange_feature_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Map::Featurerange>

=cut

__PACKAGE__->has_many(
  "featurerange_feature_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_relationship_subject_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureRelationship>

=cut

__PACKAGE__->has_many(
  "feature_relationship_subject_ids",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "foreign.subject_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_relationship_object_ids

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureRelationship>

=cut

__PACKAGE__->has_many(
  "feature_relationship_object_ids",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "foreign.object_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature_synonyms

Type: has_many

Related object: L<Bio::Chado::Schema::Sequence::FeatureSynonym>

=cut

__PACKAGE__->has_many(
  "feature_synonyms",
  "Bio::Chado::Schema::Sequence::FeatureSynonym",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 library_features

Type: has_many

Related object: L<Bio::Chado::Schema::Library::LibraryFeature>

=cut

__PACKAGE__->has_many(
  "library_features",
  "Bio::Chado::Schema::Library::LibraryFeature",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phylonodes

Type: has_many

Related object: L<Bio::Chado::Schema::Phylogeny::Phylonode>

=cut

__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 studyprop_features

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::StudypropFeature>

=cut

__PACKAGE__->has_many(
  "studyprop_features",
  "Bio::Chado::Schema::Mage::StudypropFeature",
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X4vq477xBLh8Dz4/6KEFWQ

use Carp;

=head1 ADDITIONAL RELATIONSHIPS

=head2 primary_dbxref

Alias for dbxref

=cut

__PACKAGE__->belongs_to
    ( 'primary_dbxref',
      'Bio::Chado::Schema::General::Dbxref',
      { 'foreign.dbxref_id' => 'self.dbxref_id' },
    );

=head1 MANY-TO-MANY RELATIONSHIPS

=head2 dbxrefs_mm

Relation to L<Bio::Chado::Schema::General::Dbxref: (i.e. dbxref table)
via the C<feature_dbxrefs> table.

=cut

__PACKAGE__->many_to_many
    (
     'dbxrefs_mm',
     'feature_dbxrefs' => 'dbxref',
    );

=head2 secondary_dbxrefs

Alias for dbxrefs_mm

=cut

__PACKAGE__->many_to_many
    (
     'secondary_dbxrefs',
     'feature_dbxrefs' => 'dbxref',
    );


=head1 ADDITIONAL METHODS

=head2 create_featureprops

  Usage: $set->create_featureprops({ baz => 2, foo => 'bar' });
  Desc : convenience method to create feature properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given featureprop name.  Default false.

            cv_name => cv.name to use for the given featureprops.
                       Defaults to 'feature_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms

             allow_duplicate_values => default false.
                If true, allow duplicate instances of the same cvterm
                and value in the properties of the feature.  Duplicate
                values will have different ranks.
          }
  Ret  : hashref of { propname => new featureprop object }

=cut

sub create_featureprops {
    my ($self, $props, $opts) = @_;

    # process opts
    $opts->{cv_name} = 'feature_property'
        unless defined $opts->{cv_name};
    return Bio::Chado::Schema::Util->create_properties
        ( properties => $props,
          options    => $opts,
          row        => $self,
          prop_relation_name => 'featureprops',
        );
}

=head2 search_featureprops

  Status  : public
  Usage   : $feat->search_featureprops( 'description' )
            # OR
            $feat->search_featureprops({ name => 'description'})
  Returns : DBIx::Class::ResultSet like other search() methods
  Args    : single string to match cvterm name,
            or hashref of search criteria.  This is passed
            to $chado->resultset('Cv::Cvterm')
                     ->search({ your criteria })

  Convenience method to search featureprops for a feature that
  match to Cvterms having the given criterion hash

=cut

sub search_featureprops {
    my ( $self, $cvt_criteria ) = @_;

    $cvt_criteria = { name => $cvt_criteria }
        unless ref $cvt_criteria;

     $self->result_source->schema
          ->resultset('Cv::Cvterm')
          ->search( $cvt_criteria )
          ->search_related('featureprops',
                           { feature_id => $self->feature_id },
                          );
}


######### Bio::SeqI support ###########
use base qw/ Bio::PrimarySeq /;

sub seq {
    shift()->residues;
}

sub accession_number {
    my $self= shift;

    my $pd = $self->primary_dbxref
        || $self->secondary_dbxrefs->first
      or return;

    my $acc = $pd->accession;
    my $v = $pd->version;
    $v = $v ? ".$v" : '';

    return $acc.$v;
}

sub length {
    my $self = shift;
    my $l = $self->seqlen;
    return $l if defined $l;
    return CORE::length( $self->get_column('residues')->length );
}

sub desc {
    my $self = shift;
    my $desc_fp =
        $self->search_featureprops( 'description')
             ->first;
    return unless $desc_fp;
    return $desc_fp->value;
}


sub can_call_new { 0 }

sub namespace {
    shift()->type->cv->name;
}

sub alphabet {
    shift()->throw_not_implemented()
}


# METHOD ALIASES
{
    no warnings 'once';

    *accession   = \&accession_number;

    *description = \&desc;

    *display_id  = \&name;
    *id          = \&name;
    *primary_id  = \&name;
}

1;
