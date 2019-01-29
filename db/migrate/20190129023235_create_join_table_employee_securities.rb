class CreateJoinTableEmployeeSecurities < ActiveRecord::Migration[5.2]
  def change
    create_join_table :employees, :securities do |t|
      t.index [:employee_id, :security_id]
      t.index [:security_id, :employee_id]
    end
  end
end
