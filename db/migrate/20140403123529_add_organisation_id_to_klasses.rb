class AddOrganisationIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :organisation_id, :integer
  end
end
