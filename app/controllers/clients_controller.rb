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

  private
  
  def clients_web_service id_client=""
    clients = {}
    path = "http://143.107.102.37:443/webservices/usuarios"

    response = RestClient.get path, {:accept => :json}
    # response = """[
#       { 
#         \"_id\":\"515c6789789c8119c600000b\",
#         \"celular\":\"11996012456\",
#         \"login\":\"admin\",
#         \"nome\":\"Administrador \",
#         \"telefone\":\"1932586366\",
#         \"email\":\"admingmail.com\",
#         \"cpf\":\"38926370836\",
#         \"instituicao\":\"POLI-USP\",
#         \"grupo\":{\"internal_id\":1},
#         
#         \"endereco\":\"Rua do Ouvidor, 72\",
#         \"cep\":\"13104-138\",
#         \"cidade\":\"Campinas\",
#         \"estado\":\"SP\",
#         \"pais\":\"Brasil\",
#         
#         \"last_sign_in_at\":null,
#         \"last_sign_in_ip\":null,
#         \"remember_created_at\":null,
#         \"reset_password_sent_at\":null,
#         \"reset_password_token\":null,
#         \"sign_in_count\":0,
#         \"current_sign_in_at\":null,
#         \"current_sign_in_ip\":null
#       },
#       { 
#         \"_id\":\"515c6789789c8119c600000c\",
#         \"celular\":null,
#         \"login\":null,
#         \"nome\":null,
#         \"telefone\":null,
#         \"email\":\"admingmail.com\",
#         \"cpf\":null,
#         \"instituicao\":null,
#         \"grupo\":{\"internal_id\":2},
#         
#         \"endereco\":\"Rua Válson Lopes, 70\",
#         \"cep\":null,
#         \"cidade\":null,
#         \"estado\":null,
#         \"pais\":null,
#         
#         \"last_sign_in_at\":null,
#         \"last_sign_in_ip\":null,
#         \"remember_created_at\":null,
#         \"reset_password_sent_at\":null,
#         \"reset_password_token\":null,
#         \"sign_in_count\":0,
#         \"current_sign_in_at\":null,
#         \"current_sign_in_ip\":null
#       }
#     ]"""
    clients_json = JSON.parse response
    
    clients_json.each do |cl_json|
      if id_client.empty? or id_client == cl_json["_id"]
        client = Client.new
        cl_json.each_pair do |k, v|
          if client.attributes.include? k
            client[k] = v
          end
        end
        client["clientType"] = Client.client_types[cl_json["grupo"]["internal_id"]]
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
