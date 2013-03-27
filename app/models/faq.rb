class Faq < ActiveRecord::Base
  attr_accessible :answer, :question, :subject_id
  belongs_to :subject

  validates :question, :presence => {:message => "Favor digitar uma resposta"}, :uniqueness => {:message => "Tem que ser unico"}, :length => { :in => 5..255 , :message => "Tem que ser entre 5 e 255 caracteres"}
  validates :answer, :presence => {:message => "Favor digitar uma resposta"}
  validates :subject_id, :presence => {:message => "Favor digitar um assunto"}

  scope :sorted, order('faqs.question ASC')
end
