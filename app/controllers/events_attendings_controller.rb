class EventsAttendingsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        @event_attending = EventAttending.new(event_attending_params)
        #@event_attending = EventAttending.new(event_id: 2, user_id: 1)

        if @event_attending.save
            redirect_to root_path
        else
            #redirect_to root_path, status: :unprocessable_entity
            flash[:alert] = @event_attending.errors.full_messages
            redirect_to root_path
        end
    end

    def destroy
        @event_attending = EventAttending.destroy(params[:id])
        redirect_to root_path
    end

    private
    def event_attending_params
      params.require(:event_attending).permit(:event_id, :user_id)
    end

end
