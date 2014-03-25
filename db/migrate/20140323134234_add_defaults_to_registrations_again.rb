class AddDefaultsToRegistrationsAgain < ActiveRecord::Migration
  def up
    change_table :registrations do |t|
      t.change :late, :boolean, null: false, default: false
      t.change :absence_approved, :boolean, null: false, default: false
      t.change :attended, :boolean, null: false, default: false
    end
  end

  def down
    change_table :registrations do |t|
      t.change :late, :boolean, null: true
      t.change :absence_approved, :boolean, null: true
      t.change :attended, :boolean
    end
  end
end
