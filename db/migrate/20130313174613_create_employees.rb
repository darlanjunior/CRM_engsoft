class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :employeeCode
      t.Date :dateOfBirth

      t.timestamps
    end
  end
end
