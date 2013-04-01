class MarketingAction < ActiveRecord::Base
  attr_accessible :description, :name, :action_type, :value
  
  belongs_to :marketing_campaign
  
  belongs_to :banner
  
  def self.marketing_types
  	return ['Banner',
  					'TV',
  					'Radio',
  					'Panfleto',
  					'Outro']
  end
  
  def validate_banner_not_empty
  	if(action_type == "Banner")
  		if(banner.nil?)
  			errors.add(:base, "Caso a acao seja um banner, um banner deve ser selecionado")
  		end
  	end
  end
  
  validates :name, :presence => {:message => "Favor digitar um nome"}, :length => { :in => 5..255 , :message => "Deve possuir entre 5 e 255 caracteres"}
	validates :value, :presence => {:message => "Favor digitar um preco"}, :numericality => {:message => "O preco deve ser um numero"}, :format => {:message => "Digite um valor da forma 111.11", :with => /^\d+\.*\d{0,2}$/ }
	validates :action_type, :inclusion => {:message => "O tipo da acao deve ser Banner, TV, Radio, Panfleto ou Outro", :in => MarketingAction.marketing_types}
	
	validate :validate_banner_not_empty
end
