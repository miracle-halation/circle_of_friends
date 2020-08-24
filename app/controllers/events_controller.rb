class EventsController < ApplicationController
	before_action :set_circle
	before_action :ser_event, only: [:show, :edit, :update]
	def new
		@event = @circle.events.new()
	end

	def create
		@event = @circle.events.new(event_params)
		if @event.save
			redirect_to @circle
		else
			render :new
		end
	end

	def show
		@users = @circle.users
	end

	def edit
	end

	def update
		if @event.update(event_params)
			redirect_to circle_event_path(@circle, @event)
		else
			render :edit
		end
	end

	def destroy
	end

	private

	def event_params
		params.require(:event).permit(:title, :body, :start_time, :end_time, :circle_id)
	end

	def set_circle
    @circle = Circle.find(params[:circle_id])
	end
	
	def ser_event
		@event = Event.find(params[:id])
	end
end
