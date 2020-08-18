class CirclesController < ApplicationController

	def index
	end

	def new
		@circle = Circle.new()
	end

	def create
		@circle = Circle.new(circle_params)
		binding.pry
		if @circle.save
			flash[:success] = "Create circle"
			redirect_to root_path
		else
			flash[:danger] = "Failed create"
			render :new
		end
	end

	private

	def circle_params
		params.require(:circle).permit(:name, :description, :genre_id, :activity_id, :age_range_id, :prefecture_id, :leader).merge(user_ids: current_user.id)
	end
end
