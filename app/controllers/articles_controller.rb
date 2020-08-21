class ArticlesController < ApplicationController
  before_action :sign_in_user?
  before_action :set_circle
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :circle_user?, only: [:new]
  before_action :create_user?, only: [:edit, :update, :destroy]
  def new
    @article = @circle.articles.new
  end

  def show
  end

  def create
    @article = @circle.articles.new(article_params)
    if @article.save
      redirect_to circle_path(@circle)
    else
      redirect_to new_circle_article_path(@circle)
      flash.now[:alert] = '作成に失敗しました'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to circle_article_path(@circle, @article)
    else
      redirect_to edit_circle_article_path(@circle, @article)
      flash.now[:alert] = '編集に失敗しました'
    end
  end

  def destroy
    if @article.destroy
      redirect_to circle_path(@circle)
    else
      render circle_article_path(@circle, @article)
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

  def set_article
    @article = Article.find(params[:id])
  end

  def create_user?
    return redirect_to root_path unless @article.user == current_user
  end
end
