package Bio::Chado::Schema::Contact::ContactRelationship;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("contact_relationship");
__PACKAGE__->add_columns(
  "contact_relationship_id",
  {
    data_type => "integer",
    default_value => "nextval('contact_relationship_contact_relationship_id_seq'::regclass)",
    is_auto_increment => 1,
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
);
__PACKAGE__->set_primary_key("contact_relationship_id");
__PACKAGE__->add_unique_constraint(
  "contact_relationship_c1",
  ["subject_id", "object_id", "type_id"],
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "object_id" },
);
__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "subject_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MgrSW7hG0QNdtbJ54/UA/Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;