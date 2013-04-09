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

  private
  
  def clients_web_service id_client="", type_client=Client
    clients = {}
    # path = "http://143.107.102.37:443/webservices/usuarios"
    path = "http://localhost:3005/webservices/usuarios"
    if not id_client.empty?
      path << "?id=" + id_client
    end

    response = RestClient.get path, {:accept => :json}
    clients_json = JSON.parse response
    
    clients_json.each do |cl_json|
      if id_client.empty? or id_client == cl_json["_id"]
        client = type_client.new
        cl_json.each_pair do |k, v|
          if client.attributes.include? k
            client[k] = v
          end
        end
        if not cl_json["empresa"].nil?
          client["instituicao"] = cl_json["empresa"]["nome"]
        end
        client["client_type"] = Client.client_types[cl_json["grupo"]["internal_id"]]
        client["endereco"] = build_address cl_json
        clients[client["_id"]] = client
      end
    end

    if not id_client.empty?
      return clients[id_client]
    end
    return clients
  end

end
