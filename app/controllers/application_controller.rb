require 'rest_client'
require 'json'


class ApplicationController < ActionController::Base
  protect_from_forgery

  def build_address obj
    endereco = ""
    if not obj["endereco"].nil?
      endereco << obj["endereco"]
      if not obj["cep"].nil?
        endereco << ", CEP " + obj["cep"]
      end
      if not obj["cidade"].nil?
        endereco << ", " + obj["cidade"]
        if not obj["estado"].nil?
          endereco << "/" + obj["estado"]
        end
      end
      if not obj["pais"].nil?
        endereco << " - " + obj["pais"]
      end
    end

    return endereco
  end


  def clients_web_service id_client="", type_client=Client
    clients = {}
    path = "http://estagiofacil.no-ip.org:443/webservices/usuarios"
     #path = "http://localhost:3005/webservices/usuarios"
    if not id_client.empty?
      path << "/" + id_client
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
        client["login"] ||= client["email"]
        clients[client["_id"]] = client
      end
    end

    if not id_client.empty?
      return clients[id_client]
    end
    return clients
  end



  def employees_web_service id_employee = ""

    #path = "http://estagiofacil.no-ip.org:3003/employees"
    path = "http://127.0.0.1t:3000/employees"

    employees = {};
    if(id_employee!=nil)
      path << "/" + id_employee
    end


    response = RestClient.get path
    employees_json = JSON.parse response

    employees_json.each do |employee_json|
      employee = WsEmployee.new
      employee_json.each_pair do |attr,val|
        if employee.attributes.include? attr
          employee[attr] = val
        end
      end
      result_employees << employee;
    end

    return result_employees

  end

end
