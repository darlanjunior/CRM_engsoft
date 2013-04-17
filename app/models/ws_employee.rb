class  WsEmployee < Tableless
  column :_id
  column :address
  column :cpf
  column :name


  attr_accessible :_id,:name,:address,:cpf


end