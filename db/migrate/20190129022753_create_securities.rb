class CreateSecurities < ActiveRecord::Migration[5.2]
  def change
    create_table :securities do |t|
      t.string :name
      t.string :description
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
