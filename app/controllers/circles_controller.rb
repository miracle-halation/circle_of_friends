class CirclesController < ApplicationController

	def index
	end

	def new
		@circle = Circle.new()
	end

	def create
	end

	private

	def circle_params
		params.require(:circle).permit(:name, :description, :genre_id, :activity_id, :age_range_id, :prefecture_id).merge(user_id: current_user.id)
	end
end
