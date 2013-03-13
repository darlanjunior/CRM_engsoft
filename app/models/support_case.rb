class SupportCase < ActiveRecord::Base


  attr_accessible :caseCode, :description, :status, :type
belongs_to :contact
end
