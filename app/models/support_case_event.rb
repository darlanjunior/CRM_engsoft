class SupportCaseEvent < ActiveRecord::Base
  attr_accessible :content, :description, :eventType
  belongs_to :support_case
  belongs_to :employee

end
