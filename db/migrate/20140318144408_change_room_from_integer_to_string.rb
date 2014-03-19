class ChangeRoomFromIntegerToString < ActiveRecord::Migration
  def up
    change_column :lessons, :room, :string
  end

  def down
    change_column :lessons, :room, :integer
  end
end
