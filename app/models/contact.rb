# encoding: UTF-8
class Contact < ActiveRecord::Base
  attr_accessible :clientId, :name, :email, :phone, :address, :clientType, :institution
  has_many :support_cases
  has_and_belongs_to_many :contact_groups

  def self.contact_types
    return {
        'aluno' => 'Aluno',
        'resp_instituicao' => 'Responsável da Instituição', 
        'resp_empresa' => 'Responsável da Empresa',
        'admin_instituicao' => 'Admin Instituição',
        'admin_empresa' => 'Admin Empresa'
      }
  end

  validates :clientId,
    :uniqueness => {:message => "Esse cliente já foi importado anteriormente"}
  validates :name,
    :presence => {:message => "Favor digitar um nome"},
    :uniqueness => {:message => "Esse nome já existe no sistema"},
    :length => { :in => 3..255 , :message => "Tem que ter entre 3 e 255 caracteres"}
  validates :email,
      :presence => {:message => "Favor digitar um e-mail"},
      :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "E-mail inválido"},
      :uniqueness => {:message => "Esse e-mail já consta no sistema"}
  validates :phone,
        :presence => {:message => "Favor digitar um telefone"},
        :numericality => {:only_integer => true, :message => "Telefone só pode conter digitos de 0 a 9"},
        :length => { :in => 8..20 , :message => "Tem que ter entre 8 e 20 caracteres"}
  validates :address,
    :length => { :in => 5..255 , :message => "Tem que ter entre 5 e 255 caracteres"}
  validates :clientType,
      :inclusion => { :in => contact_types.keys, :message => "Tem que ser um desses: #{contact_types.values.join(', ')}"}
  validates :institution,
      :presence => {:message => "Favor digitar uma instituição"}
      

  scope :sorted, order('contacts.name ASC')
end
