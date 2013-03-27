class ContactGroup < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :newsletters
end
