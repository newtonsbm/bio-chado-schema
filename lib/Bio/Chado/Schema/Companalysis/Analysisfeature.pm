package Bio::Chado::Schema::Companalysis::Analysisfeature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Companalysis::Analysisfeature - Computational analyses generate features (e.g. Genscan generates transcripts and exons; sim4 alignments generate similarity/match features). analysisfeatures are stored using the feature table from the sequence module. The analysisfeature table is used to decorate these features, with analysis specific attributes. A feature is an analysisfeature if and only if there is a corresponding entry in the analysisfeature table. analysisfeatures will have two or more featureloc entries,
 with rank indicating query/subject

=cut

__PACKAGE__->table("analysisfeature");

=head1 ACCESSORS

=head2 analysisfeature_id

=head2 feature_id

=head2 analysis_id

=head2 rawscore

This is the native score generated by the program; for example, the bitscore generated by blast, sim4 or genscan scores. One should not assume that high is necessarily better than low.

=head2 normscore

This is the rawscore but
    semi-normalized. Complete normalization to allow comparison of
    features generated by different programs would be nice but too
    difficult. Instead the normalization should strive to enforce the
    following semantics: * normscores are floating point numbers >= 0,
    * high normscores are better than low one. For most programs, it would be sufficient to make the normscore the same as this rawscore, providing these semantics are satisfied.

=head2 significance

This is some kind of expectation or probability metric, representing the probability that the analysis would appear randomly given the model. As such, any program or person querying this table can assume the following semantics:
   * 0 <= significance <= n, where n is a positive number, theoretically unbounded but unlikely to be more than 10
  * low numbers are better than high numbers.

=head2 identity

Percent identity between the locations compared.  Note that these 4 metrics do not cover the full range of scores possible; it would be undesirable to list every score possible, as this should be kept extensible. instead, for non-standard scores, use the analysisprop table.

=cut

__PACKAGE__->add_columns(
  "analysisfeature_id",
  {
    data_type => "integer",
    default_value => "nextval('analysisfeature_analysisfeature_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "analysis_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "rawscore",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
  "normscore",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
  "significance",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
  "identity",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("analysisfeature_id");
__PACKAGE__->add_unique_constraint("analysisfeature_c1", ["feature_id", "analysis_id"]);

=head1 RELATIONS

=head2 feature

Type: belongs_to

Related object: L<Bio::Chado::Schema::Sequence::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "Bio::Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 analysis

Type: belongs_to

Related object: L<Bio::Chado::Schema::Companalysis::Analysis>

=cut

__PACKAGE__->belongs_to(
  "analysis",
  "Bio::Chado::Schema::Companalysis::Analysis",
  { analysis_id => "analysis_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 analysisfeatureprops

Type: has_many

Related object: L<Bio::Chado::Schema::Companalysis::Analysisfeatureprop>

=cut

__PACKAGE__->has_many(
  "analysisfeatureprops",
  "Bio::Chado::Schema::Companalysis::Analysisfeatureprop",
  { "foreign.analysisfeature_id" => "self.analysisfeature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uDs/odRCUN+vGEIC0lM6ng


# You can replace this text with custom content, and it will be preserved on regeneration
1;
