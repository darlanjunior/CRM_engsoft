# encoding: UTF-8
class Client < Tableless
  column :id
  column :name
  column :email
  column :phone
  column :clientType
  column :institution
  column :login
  column :cellphone
  column :address

  def self.client_types
    return {
        'aluno' => 'Aluno',
        'resp_instituicao' => 'Responsável da Instituição', 
        'resp_empresa' => 'Responsável da Empresa',
        'admin_instituicao' => 'Admin Instituição',
        'admin_empresa' => 'Admin Empresa'
      }
  end

  validates :id,
    :numericality => {:only_integer => true, :allow_blank => true, :message => "ID do cliente deve ser um inteiro"}
  validates :name,
    :presence => {:message => "Favor digitar um nome"},
    :length => { :in => 3..255 , :message => "Tem que ter entre 3 e 255 caracteres"}
  validates :email,
      :presence => {:message => "Favor digitar um e-mail"},
      :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "E-mail inválido"}
  validates :phone,
        :presence => {:message => "Favor digitar um telefone"},
        :numericality => {:only_integer => true, :message => "Telefone só pode conter digitos de 0 a 9"},
        :length => { :in => 8..20 , :message => "Tem que ter entre 8 e 20 caracteres"}
  validates :address,
    :length => { :in => 5..255 , :message => "Tem que ter entre 5 e 255 caracteres"}
  validates :clientType,
      :inclusion => { :in => client_types, :message => "Tem que ser um desses: #{client_types.keys.join(', ')}"}
  validates :institution,
      :presence => {:message => "Favor digitar uma instituição"}
end
