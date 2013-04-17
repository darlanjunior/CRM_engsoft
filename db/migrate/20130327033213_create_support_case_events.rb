class CreateSupportCaseEvents < ActiveRecord::Migration
  def change
    create_table :support_case_events do |t|
      t.string :eventType
      t.string :description
      t.string :content
      t.references :support_case
      t.references :employee

      t.timestamps
    end
    add_index(:support_case_events, :support_case_id)
    add_index(:support_case_events, :employee_id)
  end
end
