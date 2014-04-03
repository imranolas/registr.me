class AddOrganisationIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :organisation_id, :integer
  end
end
