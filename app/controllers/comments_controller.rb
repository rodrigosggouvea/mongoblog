class CommentsController < ApplicationController
	before_filter :authenticate_user!
	def create
		@article = Article.find(parms[:article_id])
		if @article.comments.create(params[:comment])
			redirect to @article, :notice => "Comment created!"
		else
			render @article, :error => "You fucked someting up."
		end
	end
end
