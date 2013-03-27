# encoding: UTF-8
class Subject < ActiveRecord::Base
  attr_accessible :description, :subject
  has_many :faqs

  validates :description,
    :presence => {:message => "Favor digitar uma descrição"}
  validates :subject,
    :presence => {:message => "Favor digitar um assunto"},
    :uniqueness => {:message => "Esse assunto já existe no sistema"},
    :length => { :in => 5..255 , :message => "Tem que ter entre 5 e 255 caracteres"}

  scope :sorted, order('subjects.subject ASC')
end
