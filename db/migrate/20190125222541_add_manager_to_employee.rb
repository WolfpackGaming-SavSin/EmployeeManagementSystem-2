class AddManagerToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :manager, index: true
  end
end
