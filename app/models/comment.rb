class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :support_case
  belongs_to :employee
end
