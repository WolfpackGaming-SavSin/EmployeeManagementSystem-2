class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :job_title, null: false
      t.string :ext
      t.string :direct_phone
      t.string :direct_fax
      t.date :dob
      t.date :anniversary
      t.boolean :status
      t.timestamps
    end
  end
end
