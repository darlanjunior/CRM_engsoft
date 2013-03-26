class Call < ActiveRecord::Base
  attr_accessible :call_date, :comments, :reason, :status
  belongs_to :contact 
end
