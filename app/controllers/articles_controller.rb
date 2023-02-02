class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin!, only: [:edit, :update, :destroy]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = current_user.articles.build
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
    
        if @article.update(article_params)
          redirect_to @article
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to root_path, status: :see_other
    end


    private
        def article_params
            params.require(:article).permit(:titre,:contenu)
        end

        def require_admin!
            unless current_user.admin?
              redirect_to root_path, alert: "You are not authorized to access this page."
            end
        end
end
