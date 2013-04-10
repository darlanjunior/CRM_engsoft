# encoding: UTF-8
require 'rest_client'
require 'json'

class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  def index
    @clients = clients_web_service

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = clients_web_service params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end
  
  def show_report
    @client = clients_web_service params[:id], ClientReportInfo

    respond_to do |format|
      format.html # show_report.html.erb
      format.json { render json: @client }
    end
  end

end
