class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  # before_filter :validate_user, :on => [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @article.user = current_user
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private

  def validate_user
    if current_user != Article.find(params[:id]).user
      redirect_to Article.find(params[:id]), :errors => "You can`t edit this article"
    end
  end
end
