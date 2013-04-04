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
end
