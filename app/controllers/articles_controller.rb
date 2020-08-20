class ArticlesController < ApplicationController
	def index
		@articles = Circle.includes(articles)
	end

	def new
		@article = Circle.articles.new()
	end

	def create
	end

end
