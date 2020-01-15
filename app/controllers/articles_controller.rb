class ArticlesController < ApplicationController


  def index
    begin
    @article = Article.all
    rescue ActiveRecord::RecordNotFound
      error!({ status: :error, message: :not_found }, 404)
    end
	end

  def show
    begin
		@article = Article.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			error!({ status: :error, message: :not_found }, 404)
		end
	end

	def new
		@article = Article.new
	end

  def edit
    begin
    @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      error!({ status: :error, message: :not_found }, 404)
    end
	end

	def create
		@user = User.find(current_user.id)
    	@article = @user.articles.create(article_params)
		if @article.save
    		redirect_to @article
  		else
    		render 'new'
  		end
	end

	def update
  		@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    		redirect_to @article
  		else
    		render 'edit'
  		end
	end

	def destroy
    	@article = Article.find(params[:id])
    	@article.destroy
 
    	redirect_to articles_path
  	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end
end
