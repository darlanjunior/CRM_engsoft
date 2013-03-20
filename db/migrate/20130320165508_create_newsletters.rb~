class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :title
      t.text :message_body
      t.datetime :send_date

      t.timestamps
    end
  end
end
