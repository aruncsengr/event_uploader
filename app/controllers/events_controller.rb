class EventsController < ApplicationController
  def index
    start_time = DateTime.parse(params[:start].to_s)
    end_time = DateTime.parse(params[:end].to_s)

    @events = Event.between(start_time, end_time)
    respond_to do |format|
      format.html
      format.json
    end
	end
end
