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
  end
end
