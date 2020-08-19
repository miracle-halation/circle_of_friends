class CirclesController < ApplicationController
  before_action :sign_in_user?, only: [:new, :edit]
  before_action :set_circle, only: [:show, :edit, :update, :destroy]
  before_action :leader_user?, only: [:edit]

  def index
    @circles = Circle.all.order(created_at: 'DESC')
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

  def show
    @users = User.find(@circle.user_ids)
  end

  def edit
    @users = User.includes(:circles).where.not(id: @circle.leader_user.id)
  end

  def update
    if @circle.update(circle_params)
      redirect_to circle_path(@circle)
    else
      render :edit
    end
  end

  def destroy
    if @circle.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def joing
    @circle = Circle.find(params[:circle_id])
    unless @circle.users.include?(current_user)
      @circle.invite(current_user)
      redirect_to circle_path(@circle)
    else
      redirect_to root_path
    end
  end

  def withdrawal
    @circle = Circle.find(params[:circle_id])
    unless @circle.leader_user == current_user
      @circle.withdrawal(current_user)
      redirect_to root_path
    else
      redirect_to circle_path(@circle)
    end
  end

  private

  def circle_params
    params.require(:circle)
          .permit(:name, :description, :genre_id, :activity_id, :age_range_id, :prefecture_id, :leader, user_ids: [])
          .merge(leader_user: current_user)
  end

  def sign_in_user?
    return redirect_to new_user_session_path unless signed_in?
  end

  def set_circle
    @circle = Circle.find(params[:id])
  end

  def leader_user?
    redirect_to root_path unless @circle.leader_user == current_user
  end
end
