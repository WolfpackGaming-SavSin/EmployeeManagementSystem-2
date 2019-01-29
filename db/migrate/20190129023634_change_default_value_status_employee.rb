class ChangeDefaultValueStatusEmployee < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :status, :boolean, default: true
  end
end
