class AddRoleToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :role, :string
  end
end
