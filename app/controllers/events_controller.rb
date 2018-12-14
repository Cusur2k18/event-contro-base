class EventsController < ApiController

  def index
    if (params[:filter_type] != 'all')
      @events = Event.send params[:filter_type], params[:value]
    else
      @events = Event.send params[:filter_type]
    end
    render json: @events.to_json
  end

  def enroll
    @enroll = Enrollment.new({ :user_id, params[:user_id], event_id: params[:event_id], attended: false })

    if (@enroll.save)
        render json: @enroll.to_json
    else
      render json: { error: 'Error al guardar el registro' }
    end
  end
end
