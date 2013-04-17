class CommentsController < ApplicationController
	before_filter :authenticate_user!
	def create
		@article = Article.find(params[:article_id])
		if @article.comments.create(params[:comment])
			redirect_to @article, :notice => "Comment created!"
		else
			render @article, :error => "You fucked someting up."
		end
	end
end
