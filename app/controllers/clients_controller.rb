# encoding: UTF-8
require 'rest_client'
require 'json'

class ClientsController < ApplicationController
  before_filter :clients_web_service

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
    @client = @clients[params[:id].to_i]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  private
  
  def clients_web_service
    # TODO: Change to webservice Clients
    @clients = {}
    @types = {
      "aluno" => "http://localhost:3000/portal/aluno.json",
      "resp_instituicao" => "http://localhost:3000/portal/resp_instituicao.json",
      "resp_empresa" => "http://localhost:3000/portal/resp_empresa.json",
      "admin_instituicao" => "http://localhost:3000/portal/admin_instituicao.json",
      "admin_empresa" => "http://localhost:3000/portal/admin_empresa.json"
    }
    @types.each_pair do |kt, vt|
      # response = RestClient.get vt, {:accept => :json}
      case kt
      when "aluno"
        response = """[
          {
            \"id\":5,
            \"email\":\"vlassance@gmail.com\",
            \"name\":\"Victor Lassance Oliveira e Silva\",
            \"login\":\"vlassance\",
            \"cellphone\":\"11996012456\",
            \"phone\":\"6503873751\",
            \"address\":\"Rua do Ouvidor, 72\",
            \"institution\":\"USP\"
          },
          {
            \"id\":6,
            \"email\":\"alandbarroso@gmail.com\",
            \"name\":\"Alan\",
            \"login\":\"alandbarroso\",
            \"cellphone\":\"1712345678\",
            \"phone\":\"1787654321\",
            \"address\":\"Rio Preto\",
            \"institution\":\"POLI\"
      
          }
        ]"""
      when "resp_instituicao"
        response = """[
          {
            \"id\":7,
            \"email\":\"risco@gmail.com\",
            \"name\":\"Jorge Risco\",
            \"login\":\"risco\",
            \"cellphone\":\"11456546456\",
            \"phone\":\"\",
            \"address\":\"Lab soft.\",
            \"institution\":\"PCS\"
          },
          {
            \"id\":8,
            \"email\":\"sbmorais@gmail.com\",
            \"name\":\"Sergio Bueno de Morais\",
            \"login\":\"sbmorais\",
            \"cellphone\":\"1997972524\",
            \"phone\":\"1932586366\",
            \"address\":\"Rua do Ouvidor, 72\",
            \"institution\":\"FAAP\"
        
          }
        ]"""
      when "resp_empresa"
        response = """[
          {
            \"id\":9,
            \"email\":\"risco@gmail.com\",
            \"name\":\"Resp Empresa\",
            \"login\":\"risco\",
            \"cellphone\":\"11456546456\",
            \"phone\":\"\",
            \"address\":\"Lab soft.\",
            \"institution\":\"PCS\"
          }
        ]"""
      when "admin_instituicao"
        response = """[
          {
            \"id\":10,
            \"email\":\"risco@gmail.com\",
            \"name\":\"Admin Instituicao\",
            \"login\":\"risco\",
            \"cellphone\":\"11456546456\",
            \"phone\":\"\",
            \"address\":\"Lab soft.\",
            \"institution\":\"PCS\"
          }
        ]"""
      else # admin_empresa
        response = """[
          {
            \"id\":11,
            \"email\":\"risco@gmail.com\",
            \"name\":\"Admin Empresa\",
            \"login\":\"risco\",
            \"cellphone\":\"11456546456\",
            \"phone\":\"\",
            \"address\":\"Lab soft.\",
            \"institution\":\"PCS\"
          }
        ]"""
        
      end
      @clients_json = JSON.parse response
      @clients_json.each do |cl_json|
        @client = Client.new
        cl_json.each_pair do |k, v|
          if @client.attributes.include? k
            @client[k] = v
          end
        end
        @client["clientType"] = kt
        @clients[@client["id"]] = @client
      end
    end
  end

end
