class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.boolean :status

      t.timestamps
    end
  end
end
