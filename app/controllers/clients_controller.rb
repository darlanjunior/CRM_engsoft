# encoding: UTF-8
require 'rest_client'
require 'json'

class ClientsController < ApplicationController
  before_filter :clients_web_service
  before_filter :define_client_types

  # GET /clients
  # GET /clients.json
  def index
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    # TODO: Chance to webservice Client
    @client = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  private
  
  def clients_web_service
    # TODO: Chance to webservice Clients
    # response = RestClient.get 'http://localhost:3000/dummy/clients.json', {:accept => :json}
    # @clients = JSON.parse response
    @clients = Contact.all
  end

  def define_client_types
    @client_types = {
      'Responsável da Instituição' => 'resp_instituicao', 
      'Responsável da Empresa' => 'resp_empresa'
    }
    @client_types_inv = {
      'resp_instituicao' => 'Responsável da Instituição', 
      'resp_empresa' => 'Responsável da Empresa'
    }
  end
end
