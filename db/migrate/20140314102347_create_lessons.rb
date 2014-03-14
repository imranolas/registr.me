class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.datetime :date_time
      t.references :teacher
      t.references :klass
      t.string :room

      t.timestamps
    end
    add_index :lessons, :teacher_id
    add_index :lessons, :klass_id
  end
end
