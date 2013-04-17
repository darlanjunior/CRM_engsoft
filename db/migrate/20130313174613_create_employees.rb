class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :address
      t.string :cpf
      t.string :remote_id

      t.timestamps
    end
  end
end
