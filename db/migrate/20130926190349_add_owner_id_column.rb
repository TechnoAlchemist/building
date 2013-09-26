class AddOwnerIdColumn < ActiveRecord::Migration
  def up
    add_column :building_units, :building_owner_id, :integer
  end

  def down
    remove_column :building_units, :building_owner_id
  end
end
