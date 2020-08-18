class CirclesController < ApplicationController
  before_action :sign_in_user?, only: [:new]

  def index
  end

  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    if @circle.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def circle_params
    params.require(:circle).permit(:name, :description, :genre_id, :activity_id, :age_range_id, :prefecture_id, :leader).merge(user_ids: current_user.id)
  end

  def sign_in_user?
    return redirect_to new_user_session_path unless signed_in?
  end
end
