class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :reason
      t.text :comments
      t.string :status
      t.datetime :call_date
      t.references :contact

      t.timestamps
    end
    add_index(:calls, :contact_id)
  end
end
