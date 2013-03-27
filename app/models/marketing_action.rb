class MarketingAction < ActiveRecord::Base
  attr_accessible :description, :name, :type, :value
  
  belongs_to :marketing_campaign
  
  belongs_to :banner
end
