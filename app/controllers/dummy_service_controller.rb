class DummyServiceController < ApplicationController
	def client
		respond_to do |format|
      		format.json { render json: Contact.all, :only => [:id, :name, :email, :phone, :clientType] }
    	end
	end
end
