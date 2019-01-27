class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :suite
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.boolean :status
      t.timestamps
    end
  end
end
