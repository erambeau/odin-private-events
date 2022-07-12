class EventsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]

    def index
        @events = Event.all
        @event_attending = EventAttending.new
    end

    def show
        @event = Event.find(params[:id])
        @users = User.all
    end


    def new
        @event = Event.new
    end


    def create
        @event = current_user.events.build(event_params)

        if @event.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
        
    end


    private
    def event_params
      params.require(:event).permit(:date_event, :location, :creator_id)
    end

end
