class SupportCase < ActiveRecord::Base

  attr_accessible  :description, :status, :caseType, :employee_id , :contact


	belongs_to :contact
	belongs_to :employee
  has_many :comments
  has_many :support_case_events

  @@CASE_STATUS_ONGOING = "Em andamento"
  @@CASE_STATUS_CLOSED = "Fechado"

  @@CASE_TYPE_PROBLEM = "Problema"
  @@CASE_TYPE_DOUBT = "Duvida"

  CASE_TYPES = ['Problema','Duvida']
  CASE_STATUS = ['Em andamento','Fechado']

  validates :description,
            :presence => {:message => "Favor digitar a descricao"}
  validates :status,
            :presence => {:message => "Favor selecionar um status"},
            :inclusion => {:in => CASE_STATUS}
  validates :caseType,
            :presence => {:message => "Favor selecionar um Tipo"},
            :inclusion => {:in => CASE_TYPES}



  def addComment(comment)
    comments << Comment.new(comment)
  end



end
