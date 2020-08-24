class EventsController < ApplicationController
	before_action :set_circle
	def new
		@event = @circle.events.new()
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def set_circle
    @circle = Circle.find(params[:circle_id])
  end
end
