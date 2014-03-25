class AddDefaultsToRegistrations < ActiveRecord::Migration
  def change
    Registration.all.each do |r|
      
      r.update_attributes(late: false, absence_approved: false)
    end
    change_table :registrations do |t|
      t.change :late, :boolean, null: false
      t.change :absence_approved, :boolean, null: false
    end
  end
end
