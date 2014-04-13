class AddFieldsToOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :address1, :string
    add_column :organisations, :address2, :string
    add_column :organisations, :address3, :string
    add_column :organisations, :town, :string
    add_column :organisations, :postcode, :string
  end
end
