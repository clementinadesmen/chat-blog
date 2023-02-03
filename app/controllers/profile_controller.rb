class ProfileController < ApplicationController
    def index
      @profiles = Profile.all 
    end

    def new
      @profile = Profile.new
    end
    
    def create
      @profile = current_user.profile.build(profile_params)
      if @profile.save
        flash[:sucess] = "Votre profil a bien été crée"
        redirect_to @profile
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    private
      def profile_params
        params.require(:profile).permit(:name, :bio)
      end
end