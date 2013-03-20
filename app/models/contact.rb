class Contact < ActiveRecord::Base
  attr_accessible :address, :clientId, :email, :name, :phone, :clientType

has_many :support_case
end
