class MarketingCampaign < ActiveRecord::Base
	attr_accessible :begin_date, :description, :end_date, :estimated_begin_date, :estimated_end_date, :estimated_return_over_investiment, :name, :status
  
  has_many :marketing_actions, :dependent => :destroy
  
  has_and_belongs_to_many :contact_groups
end
