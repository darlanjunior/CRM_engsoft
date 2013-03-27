class Subject < ActiveRecord::Base
  attr_accessible :description, :subject
  has_many :faqs

  validates :description,
    :presence => {:message => "Favor digitar uma resposta"}
  validates :subject,
    :presence => {:message => "Favor digitar uma resposta"},
    :uniqueness => {:message => "Tem que ser unico"},
    :length => { :in => 5..255 , :message => "Tem que ser entre 5 e 255 caracteres"}

  scope :sorted, order('subjects.subject ASC')
end
