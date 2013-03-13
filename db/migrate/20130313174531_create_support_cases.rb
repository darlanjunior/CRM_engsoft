class CreateSupportCases < ActiveRecord::Migration
  def change
    create_table :support_cases do |t|
      t.string :caseCode
      t.string :description
      t.string :type
      t.string :status

      
      t.references :contact

      t.timestamps
    end
    
    add_index(:support_cases, :contact_id)
  end
end
