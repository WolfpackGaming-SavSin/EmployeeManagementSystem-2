class CreateJoinTableEmployeeLocation < ActiveRecord::Migration[5.2]
  def change
    create_join_table :employees, :locations do |t|
      t.index [:employee_id, :location_id]
      t.index [:location_id, :employee_id]
    end
  end
end
