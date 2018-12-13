class EventsController < ApiController

  def index
    if (params[:filter_type] != 'all')
      @events = Event.send params[:filter_type], params[:value]
    else
      @events = Event.send params[:filter_type]
    end
    render json: @events.to_json
  end
end
