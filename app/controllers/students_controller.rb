class StudentsController < ApiController

  def login
    client = Savon.client(wsdl: Rails.application.credentials[Rails.env.to_sym][:cusur_wsdl])
    xmlResponse = client.call(:datos_alumno, { message: { pCodigo: params[:studentCode], pNip: params[:nip]}})
    response = JSON.parse xmlResponse.body[:datos_alumno_response][:return]

    if response['error']
      render json: response
    else
      student = Student.find_or_create_by(student_code: response['codigo']) do |user|
        user.name = response['nombre']
        user.student_code = response['codigo']
        user.career = response['carrera_desc']
      end

      render json: student.to_json
    end
  end

  def assistance
    enroll = Enrollment.find(params[:enroll_id])
    if (enroll)
      enroll.attended = true
      enroll.attended_date = Time.now

      if (enroll.save)
          render json: { error: false, success: true, message: 'Enroll successfuly updated' }
      else
          render json: { error: true, success: false, message: 'Error while saving the Enrollment' }
      end
    end
  end

  def my_enrollments
    begin
      student = Student.find(params[:id])
      render json: student.enrollments.to_json  
    rescue
      render json: { error: true, success: false, message: 'No student for that id'}
    end    
  end
end
