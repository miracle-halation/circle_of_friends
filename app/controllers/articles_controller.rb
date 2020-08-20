class ArticlesController < ApplicationController
	def new
		@circle = Circle.find(params[:circle_id])
		@article = @circle.articles.new()
	end

	def create
		@circle = Circle.find(params[:circle_id])
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

end
