class Employee < ActiveRecord::Base
  attr_accessible :dateOfBirth, :name
  has_many :support_cases
  has_many :comments
  has_many :support_case_events

  def isFree
    if(:support_cases==nil)
      return true
    else
      return false
    end
  end
end
