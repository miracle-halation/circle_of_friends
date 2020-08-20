class ArticlesController < ApplicationController
	def index
		@circle = Circle.find(params[:circle_id])
		@articles = @circle.articles.includes(:article)
	end

	def new
		@article = Circle.articles.new()
	end

	def create
	end

end
