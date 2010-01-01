package Bio::Chado::Schema::Expression::ExpressionImage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Expression::ExpressionImage

=cut

__PACKAGE__->table("expression_image");

=head1 ACCESSORS

=head2 expression_image_id

=head2 expression_id

=head2 eimage_id

=cut

__PACKAGE__->add_columns(
  "expression_image_id",
  {
    data_type => "integer",
    default_value => "nextval('expression_image_expression_image_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "expression_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "eimage_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
);
__PACKAGE__->set_primary_key("expression_image_id");
__PACKAGE__->add_unique_constraint("expression_image_c1", ["expression_id", "eimage_id"]);

=head1 RELATIONS

=head2 eimage

Type: belongs_to

Related object: L<Bio::Chado::Schema::Expression::Eimage>

=cut

__PACKAGE__->belongs_to(
  "eimage",
  "Bio::Chado::Schema::Expression::Eimage",
  { eimage_id => "eimage_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 expression

Type: belongs_to

Related object: L<Bio::Chado::Schema::Expression::Expression>

=cut

__PACKAGE__->belongs_to(
  "expression",
  "Bio::Chado::Schema::Expression::Expression",
  { expression_id => "expression_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.04999_12 @ 2010-01-01 13:09:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rmcN3xr2IG5YNc09al89bA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
