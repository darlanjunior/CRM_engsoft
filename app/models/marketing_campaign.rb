class MarketingCampaign < ActiveRecord::Base
	attr_accessible :begin_date, :description, :end_date, :estimated_begin_date, :estimated_end_date, :estimated_revenue, :name, :status, :revenue, :financial_feedback
  
  has_many :marketing_actions, :dependent => :destroy
  
  has_and_belongs_to_many :contact_groups
  
  def value
  	sum = 0
  	
  	if(!marketing_actions.empty?)
  		for marketing_action in marketing_actions
  			sum += marketing_action.value
  		end
  	end
  
  	return sum
  end
end
