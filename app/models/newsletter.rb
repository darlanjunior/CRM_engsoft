class Newsletter < ActiveRecord::Base
  attr_accessible :message_body, :title
  
  has_and_belongs_to_many :contact_groups
end
