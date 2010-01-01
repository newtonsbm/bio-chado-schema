package Bio::Chado::Schema::CellLine::CellLineRelationship;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::CellLine::CellLineRelationship

=cut

__PACKAGE__->table("cell_line_relationship");

=head1 ACCESSORS

=head2 cell_line_relationship_id

=head2 subject_id

=head2 object_id

=head2 type_id

=cut

__PACKAGE__->add_columns(
  "cell_line_relationship_id",
  {
    data_type => "integer",
    default_value => "nextval('cell_line_relationship_cell_line_relationship_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "subject_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "object_id",
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
);
__PACKAGE__->set_primary_key("cell_line_relationship_id");
__PACKAGE__->add_unique_constraint(
  "cell_line_relationship_c1",
  ["subject_id", "object_id", "type_id"],
);

=head1 RELATIONS

=head2 subject

Type: belongs_to

Related object: L<Bio::Chado::Schema::CellLine::CellLine>

=cut

__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::CellLine::CellLine",
  { cell_line_id => "subject_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 object

Type: belongs_to

Related object: L<Bio::Chado::Schema::CellLine::CellLine>

=cut

__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::CellLine::CellLine",
  { cell_line_id => "object_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u7/YcC9dXV9HYIbEXywdig


# You can replace this text with custom content, and it will be preserved on regeneration
1;
