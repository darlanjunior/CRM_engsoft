class ContactsGroupsMarketingCampaignsJoin < ActiveRecord::Migration
  def change
  	create_table :contact_groups_marketing_campaigns, :id => false do |t|
			t.integer :marketing_campaign_id
			t.integer :contact_group_id
		end
  	
  	add_index :contact_groups_marketing_campaigns, ["marketing_campaign_id", "contact_group_id"], :unique => true, :name => "c_g_m_c_index"
  end
end
