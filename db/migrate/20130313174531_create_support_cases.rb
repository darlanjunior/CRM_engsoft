class CreateSupportCases < ActiveRecord::Migration
  def change
    create_table :support_cases do |t|
      t.date :creationDate
      t.string :caseCode
      t.string :description
      t.string :caseType
      t.string :status
      t.string :name
      t.timestamps
    end
  end
end
