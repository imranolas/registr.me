class CreateKlassesStudents < ActiveRecord::Migration
  def change
    create_table :klasses_students do |t|
      t.references :student
      t.references :klass

      t.timestamps
    end
    add_index :klasses_students, :student_id
    add_index :klasses_students, :klass_id
  end
end
