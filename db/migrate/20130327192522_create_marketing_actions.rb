class CreateMarketingActions < ActiveRecord::Migration
  def change
    create_table :marketing_actions do |t|
      t.string :name
      t.text :description
      t.string :action_type
      t.decimal :value, :precision => 8, :scale => 2
      
      t.references :banner
      t.references :marketing_campaign

      t.timestamps
    end
    
    add_index :marketing_actions, :banner_id
    add_index :marketing_actions, :marketing_campaign_id
  end
end
