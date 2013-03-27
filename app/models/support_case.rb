class SupportCase < ActiveRecord::Base

  attr_accessible  :description, :status, :caseType, :employee_id
	belongs_to :contact
	belongs_to :employee
  has_many :comments
  has_many :support_case_events

  def addComment(comment)
    comments << Comment.new(comment)
  end

end
