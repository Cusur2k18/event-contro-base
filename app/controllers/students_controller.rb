class StudentsController < ApiController

  def login
    client = Savon.client(wsdl: 'http://mw2.siiau.udg.mx/WSEscolar-war/WSEscolar?WSDL')
    xmlResponse = client.call(:datos_alumno, { message: { pCodigo: params[:code], pNip: params[:nip]}})
    response = JSON.parse xmlResponse.body[:datos_alumno_response][:return]

    if response['error']
      render json: response
    else
      @student = Student.find_or_create_by(student_code: response['codigo']) do |user|
        user.name = response['nombre']
        user.student_code = response['codigo']
        user.career = response['carrera_desc']
      end

      render json: @student.to_json
    end
  end
end
