class CreateBuildingUnits < ActiveRecord::Migration
  def change
    create_table :building_units do |t|
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :postal_code, null: false
      t.text :description

      t.timestamps
    end
    add_column :building_units, :building_owner_id, :integer
  end

end
