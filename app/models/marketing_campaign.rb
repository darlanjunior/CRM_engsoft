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
  	self.status = MarketingCampaign.next_marketing_status[self.status]
  end
  
  def previous_status
  	self.status = MarketingCampaign.previous_marketing_status[self.status]
  end
  
  def cancel_status
  	self.status = 8
  end
  
  def self.marketing_status
  	return {0 => 'Criada',
  					1 => 'Aberta',
  					2 => 'Em espera',
  					3 => 'Aprovada',
  					4 => 'Desaprovada',
  					5 => 'Iniciada',
  					6 => 'Finalizada',
  					7 => 'A ser corrigida',
  					8 => 'Cancelada',
  					9 => 'Desaprovada'}
  end
  
  def self.next_marketing_status
  	return {0 => 1,
  					1 => 2,
  					2 => 3,
  					3 => 5,
  					4 => 9,
  					5 => 6,
  					6 => 6,
  					7 => 2,
  					8 => 8,
  					9 => 7}
  end
  
  def self.previous_marketing_status
  	return {0 => 0,
  					1 => 0,
  					2 => 4,
  					3 => 2,
  					4 => 2,
  					5 => 3,
  					6 => 5,
  					7 => 2,
  					8 => 1,
  					9 => 2}
  end
end
