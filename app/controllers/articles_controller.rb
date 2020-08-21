class ArticlesController < ApplicationController
  before_action :sign_in_user?, only: [:new]
  before_action :set_circle, only: [:new, :show, :create]
  before_action :circle_user?, only: [:new]
  def new
    @article = @circle.articles.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = @circle.articles.new(article_params)
    if @article.save
      redirect_to circle_path(@circle)
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :image, :content).merge(user_id: current_user.id, circle_id: params[:circle_id])
  end

  def sign_in_user?
    return redirect_to new_user_session_path unless signed_in?
  end

  def circle_user?
    return redirect_to root_path unless @circle.users.include?(current_user)
  end

  def set_circle
    @circle = Circle.find(params[:circle_id])
  end
end
