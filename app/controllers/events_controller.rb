class EventsController < ApplicationController
  before_action :sign_in_user?
  before_action :set_circle
  before_action :ser_event, only: [:show, :edit, :update]
  before_action :circle_user?
  before_action :author_user?, only: [:edit]

  def new
    @event = @circle.events.new
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
    @users = @event.users
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

  def attend
    @event = Event.find(params[:event_id])
    if @event.users.include?(current_user)
      @event.absence(current_user)
    else
      @event.attendance(current_user)
    end
    redirect_to circle_event_path(@circle, @event)
  end

  private

  def event_params
    params.require(:event)
          .permit(:title, :body, :start_time, :end_time, :circle_id, :author)
          .merge(author_user: current_user)
  end

  def sign_in_user?
    return redirect_to new_user_session_path unless signed_in?
  end

  def set_circle
    @circle = Circle.find(params[:circle_id])
  end

  def ser_event
    @event = Event.find(params[:id])
  end

  def circle_user?
    return redirect_to root_path unless @circle.users.include?(current_user)
  end

  def author_user?
    redirect_to root_path unless @event.author_user == current_user
  end
end
