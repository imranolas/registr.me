class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :teachers, :user_id
  end
end
