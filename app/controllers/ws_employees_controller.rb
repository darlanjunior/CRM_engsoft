
class WsEmployeesController < ApplicationController

  def index
    @employees = employees_web_service

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @employees }
    end
  end

  def show
    @employee = employees_web_service params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

end