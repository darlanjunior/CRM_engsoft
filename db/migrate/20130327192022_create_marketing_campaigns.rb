class CreateMarketingCampaigns < ActiveRecord::Migration
  def change
    create_table :marketing_campaigns do |t|
      t.string :name
      t.text :description
      t.string :status
      t.date :estimated_begin_date
      t.date :estimated_end_date
      t.decimal :estimated_revenue, :precision => 8, :scale => 2
      t.text :financial_feedback
      t.date :begin_date
      t.date :end_date
      t.decimal :revenue, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
