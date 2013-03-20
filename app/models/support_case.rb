class SupportCase < ActiveRecord::Base
  attr_accessible :caseCode,:name, :creationDate, :description, :status, :caseType
  belongs_to :employee
end
