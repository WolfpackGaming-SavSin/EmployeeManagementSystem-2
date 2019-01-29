class ChangeDefaultValueStatusLocation < ActiveRecord::Migration[5.2]
  def change
    change_column :locations, :status, :boolean, default: true
  end
end
