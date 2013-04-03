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
  
  def next_status
  	if(status == 4)
  		status = 2
  	else
  		status += 1
  	end
  end
  
  def previous_status
  	if(status == 2)
  		status = 4
  	else
  		status -= 1
  	end
  end
  
  def self.marketing_status
  	return [0 => 'Criada',
  					1 => 'Pronta',
  					2 => 'Em espera',
  					3 => 'Aprovada',
  					4 => 'Desaprovada',
  					5 => 'Iniciada',
  					6 => 'Finalizada']
  end
end
