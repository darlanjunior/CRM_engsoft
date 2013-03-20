class Subject < ActiveRecord::Base
  attr_accessible :description, :subject
  has_many :faqs
end
