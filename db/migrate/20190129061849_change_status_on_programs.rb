class ChangeStatusOnPrograms < ActiveRecord::Migration[5.2]
  def change
    change_column :programs, :status, :boolean, default: true
  end
end
