class SupportCase < ActiveRecord::Base

  attr_accessible :caseCode, :description, :status, :caseType
	belongs_to :contact
	belongs_to :employee

end
