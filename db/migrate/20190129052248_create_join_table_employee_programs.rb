class CreateJoinTableEmployeePrograms < ActiveRecord::Migration[5.2]
  def change
    create_join_table :employees, :programs do |t|
      # t.index [:employee_id, :program_id]
      # t.index [:program_id, :employee_id]
    end
  end
end
