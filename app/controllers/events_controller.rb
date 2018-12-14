class EventsController < ApiController

  def index
    if (params[:filter_type] != 'all')
      events = Event.send params[:filter_type], params[:value]
    else
      events = Event.send params[:filter_type]
    end
    render json: events.to_json
  end

  def enroll
    enroll = Enrollment.new({ :student_id, params[:student_id], event_id: params[:event_id], attended: false })

    if (enroll.save)
        render json: @enroll.to_json
    else
      render json: { error: true, success: false, message: 'Error while saving the record' }
    end
  end

  def rescind
    event = Event.find(params[:event_id])
    enroll = @event.enrollments.find(params[:enroll_id])

    if enroll
      event.enrollments.delete(enroll)
      render json: { error: false, success: true, message: 'Register successfully deleted' }
    else
      render json: { error: true, success: false, message: 'Error on delete the register' }
    end

  end
end
