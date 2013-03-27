class Newsletter < ActiveRecord::Base
  attr_accessible :message_body, :title
  
  has_and_belongs_to_many :contact_groups
  
  validates :title, :presence => {:message => "Favor digitar um titulo"}, :length => { :in => 5..255 , :message => "Tem que ser entre 5 e 255 caracteres"}
  validates :message_body, :presence => {:message => "Favor digitar uma mensagem"}
end
