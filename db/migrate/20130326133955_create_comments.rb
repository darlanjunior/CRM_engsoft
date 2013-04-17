class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content

      t.references :support_case
      t.references :employee

      t.timestamps
    end
    add_index(:comments, :support_case_id)
    add_index(:comments, :employee_id)
  end
end
