class CreateBuildingOwners < ActiveRecord::Migration
  def change
    create_table :building_owners do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
