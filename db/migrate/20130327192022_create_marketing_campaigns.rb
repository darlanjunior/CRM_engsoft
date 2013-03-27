class CreateMarketingCampaigns < ActiveRecord::Migration
  def change
    create_table :marketing_campaigns do |t|
      t.string :name
      t.text :description
      t.string :status
      t.date :estimated_begin_date
      t.date :estimated_end_date
      t.decimal :estimated_return_over_investiment, :precision => 8, :scale => 2
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
