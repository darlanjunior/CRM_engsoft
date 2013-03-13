class SupportCase < ActiveRecord::Base
  attr_accessible :caseCode, :creationDate, :description, :status, :caseType
end
