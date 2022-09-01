class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit udpate destroy ]

  # GET /articles
  def index
    @articles = Article.all
    render json: @articles.as_json(include: :user)
    # render json: @comments.as_json(only: :content, include: [{user: {only: :email}}, {article: {only: :title}}] )
  end

  # GET /articles/1
  def show
    render json: @article.as_json(include: :user)
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.user_id === current_user.id && @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    if (@article.user_id === current_user.id)
      @article.destroy
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :price)
    end
end
