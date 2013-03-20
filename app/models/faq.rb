class Faq < ActiveRecord::Base
  attr_accessible :answer, :question
  belongs_to :subject

  validates :answer, :presence => {:message => "Favor digitar uma resposta"} 
  validates :question, :presence => {:message => "Favor digitar uma resposta"}, :uniqueness => true, :length => { :in => 5..255 , :message => 'Tem que ser entre 5 e 255 caracteres'}
end
