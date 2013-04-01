class Newsletter < ActiveRecord::Base
  attr_accessible :message_body, :title
  
  has_and_belongs_to_many :contact_groups
  
  validates :title, :presence => {:message => "Favor digitar um titulo"}, :length => { :in => 5..255 , :message => "Deve possuir entre 5 e 255 caracteres"}
  validates :message_body, :presence => {:message => "Favor digitar uma mensagem"}
  
  validate :validate_contact_groups_not_empty
  
  def validate_contact_groups_not_empty
  	if(contact_groups.empty?)
  		errors.add(:base, "Pelo menos um grupo deve ser selecionado")
  	end
  end
end
