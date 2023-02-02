class ApplicationController < ActionController::Base
    def authorize_user
        @article = Article.find(params[:id])
        unless @article.user == current_user
          flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
          redirect_to root_path
        end
    end
end
