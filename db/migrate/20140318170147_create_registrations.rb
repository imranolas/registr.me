class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :student
      t.references :lesson
      t.boolean :attended

      t.timestamps
    end
    add_index :registrations, :student_id
    add_index :registrations, :lesson_id
  end
end
