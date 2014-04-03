class AddOrganisationIdToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :organisation_id, :integer
  end
end
