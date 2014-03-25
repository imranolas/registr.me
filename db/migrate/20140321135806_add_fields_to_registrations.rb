class AddFieldsToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :late, :boolean
    add_column :registrations, :absence_approved, :boolean
  end
end
