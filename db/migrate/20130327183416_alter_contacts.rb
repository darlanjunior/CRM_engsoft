class AlterContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :institution, :string
  end
end
