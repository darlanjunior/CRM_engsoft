# encoding: UTF-8
class ClientReportInfo < Client
  column :_id
  column :nome
  column :email
  column :telefone
  column :client_type
  column :instituicao
  column :cpf
  column :login
  column :celular
  column :endereco
  column :last_sign_in_at
  column :last_sign_in_ip
  column :remember_created_at
  column :reset_password_sent_at
  column :reset_password_token
  column :sign_in_count
  column :current_sign_in_at
  column :current_sign_in_ip
  
  attr_accessible :_id, :nome, :email, :telefone, :client_type, :instituicao, :cpf, :login, :celular, :endereco
  attr_accessible :last_sign_in_at, :last_sign_in_ip, :remember_created_at, :reset_password_sent_at, :reset_password_token,
    :sign_in_count, :current_sign_in_at, :current_sign_in_ip

end
