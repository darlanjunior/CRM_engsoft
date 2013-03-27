class ContactGroupsNewsletterJoin < ActiveRecord::Migration
  def up
  	create_table :contact_groups_newsletters, :id => false do |t|
  		t.integer :newsletter_id
  		t.integer :contact_group_id
  	end
  	
  	add_index :contact_groups_newsletters, ["newsletter_id", "contact_group_id"], :unique => true, :name => "c_g_n_index"
  end

  def down
  	drop_table :contact_groups_newsletters
  end
end
