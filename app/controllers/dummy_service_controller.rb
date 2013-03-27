class DummyServiceController < ApplicationController
	def client
		respond_to do |format|
      		format.json { render json: Contact.all }
    	end
	end
end
