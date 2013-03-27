class ContactGroup < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :newsletters
  
  validates :name, :presence => {:message => "Favor digitar um nome"}, :uniqueness => {:message => "Tem que ser unico"}, :length => { :in => 5..255 , :message => "Tem que ser entre 5 e 255 caracteres"}
end
