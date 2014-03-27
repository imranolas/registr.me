class AddKlassIdToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :klass_id, :integer
    add_index :registrations, :klass_id
  end
end
