class EventsController < ApiController

  def index
    @events = Event.all
    binding.pry
    render json: @events.to_json
  end
end
