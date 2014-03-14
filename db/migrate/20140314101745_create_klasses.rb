class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name
      t.integer :teacher_id
      t.integer :attendance

      t.timestamps
    end
  end
end
