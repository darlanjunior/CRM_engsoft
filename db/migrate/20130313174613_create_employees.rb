class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.date :dateOfBirth

      t.timestamps
    end
  end
end
