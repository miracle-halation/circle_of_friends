class CirclesController < ApplicationController
  before_action :sign_in_user?, only: [:new, :edit, :joing, :withdrawal]
  before_action :set_circle, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit, :create, :update]
  before_action :leader_user?, only: [:edit]
  before_action :serach_circle, only: [:index, :search]

  def index
    @circles = Circle.all.with_attached_image.order(created_at: 'DESC')
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
    @users = @circle.users
    @articles = @circle.articles
    @events = @circle.events
  end

  def edit
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
    if @circle.users.include?(current_user)
      redirect_to root_path
    else
      @circle.invite(current_user)
      redirect_to circle_path(@circle)
    end
  end

  def withdrawal
    @circle = Circle.find(params[:circle_id])
    if @circle.leader_user == current_user
      redirect_to circle_path(@circle)
    else
      @circle.withdrawal(current_user)
      redirect_to root_path
    end
  end

  def search
    @results = @p.result(distinct: true)
  end

  def genre
    @circles = Circle.filter_by_genre(params[:genre])
  end

  private

  def circle_params
    params.require(:circle)
          .permit(:name, :phrase, :description, :genre_id, :activity, :age_range, :prefecture_id, :city,
                  :leader, :image, user_ids: [])
          .merge(leader_user: current_user)
  end

  def sign_in_user?
    return redirect_to new_user_session_path unless signed_in?
  end

  def set_circle
    @circle = Circle.find(params[:id])
  end

  def set_users
    @users = User.where.not(id: current_user)
  end

  def leader_user?
    redirect_to root_path unless @circle.leader_user == current_user
  end

  def serach_circle
    @p = Circle.ransack(params[:q])
  end
end
