class Contact < ActiveRecord::Base
  attr_accessible :address, :clientId, :email, :name, :phone, :clientType

has_many :support_cases
has_and_belongs_to_many :contact_groups
end
