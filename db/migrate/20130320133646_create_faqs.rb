class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :question
      t.text :answer
      t.references :subject

      t.timestamps
    end
    add_index :faqs, :subject_id
  end
end
