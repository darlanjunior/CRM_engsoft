class HomeController < ApplicationController
	def index
		debugger
		puts 'blablabla'
	end

	def login
		cookies[:username] = params[:username] 
		render :index
	end

	def logout
		cookies[:username] = nil
		render :index
	end

	def blank
		render 'public/blank.html'
	end
end