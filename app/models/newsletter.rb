class Newsletter < ActiveRecord::Base
  attr_accessible :message_body, :title
end
