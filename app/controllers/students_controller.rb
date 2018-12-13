class StudentsController < ApiController

  def login
    client = Savon.client(wsdl: 'http://mw2.siiau.udg.mx/WSEscolar-war/WSEscolar?WSDL', convert_request_keys_to: :none, log_level: :debug, log: true)
    binding.pry
    # [

    # ]
    # response = client.call()
    client.operations
  end
end
