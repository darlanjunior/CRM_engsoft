# encoding: UTF-8
class Client < Tableless
  column :_id
  column :nome
  column :email
  column :telefone
  column :clientType
  column :instituicao
  column :cpf
  column :login
  column :celular
  column :endereco

  def self.client_types # A ordem das linhas importa, não alterar
    return {
        1 => 'admin_instituicao',
        2 => 'resp_instituicao',
        3 => 'admin_empresa',
        4 => 'resp_empresa',
        5 => 'aluno'
      }
  end
  def self.client_labels # A ordem das linhas importa, não alterar
    return {
        'admin_instituicao' => 'Admin Instituição',
        'resp_instituicao' => 'Responsável da Instituição',
        'admin_empresa' => 'Admin Empresa',
        'resp_empresa' => 'Responsável da Empresa',
        'aluno' => 'Aluno'
      }
  end

  # validates :nome,
  #   :presence => {:message => "Favor digitar um nome"},
  #   :length => { :in => 3..255 , :message => "Tem que ter entre 3 e 255 caracteres"}
  # validates :email,
  #     :presence => {:message => "Favor digitar um e-mail"},
  #     :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "E-mail inválido"}
  # validates :telefone,
  #       :presence => {:message => "Favor digitar um telefone"},
  #       :numericality => {:only_integer => true, :message => "Telefone só pode conter digitos de 0 a 9"},
  #       :length => { :in => 8..20 , :message => "Tem que ter entre 8 e 20 caracteres"}
  # validates :endereco,
  #   :length => { :in => 5..255 , :message => "Tem que ter entre 5 e 255 caracteres"}
  # validates :clientType,
  #     :inclusion => { :in => client_labels, :message => "Tem que ser um desses: #{client_types.keys.join(', ')}"}
  # validates :instituicao,
  #     :presence => {:message => "Favor digitar uma instituição"}
end
