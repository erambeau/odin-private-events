class EventsAttendingsController < ApplicationController

    def create
        #@event_attending = EventAttending.build(event_attending_params)
        @event_attending = EventAttending.new(event_attending_params)

        if @event_attending.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end


    private
    def event_attending_params
      params.require(:event_attending).permit(:attended_event, :attendee)
    end

end
