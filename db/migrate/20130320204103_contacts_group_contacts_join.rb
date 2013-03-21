class ContactsGroupContactsJoin < ActiveRecord::Migration
  def up
  	create_table :contact_groups_contacts, :id => false do |t|
  		t.integer :contact_id
  		t.integer :contact_group_id
  	end
  	
  	add_index :contact_groups_contacts, ["contact_id", "contact_group_id"], :unique => true, :name => "c_g_c_index"
  end

  def down
  	drop_table :contact_groups_contacts
  end
end
