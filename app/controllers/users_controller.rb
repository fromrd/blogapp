class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to blogdates_blogs_path(@user.id)
        else
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
        @favorites_blogs = @user.favorites
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
        # if @user.save
        #     redirect_to blogdates_blogs_path(@user.id)            
        # else
        #     render 'new'
        # end
    end
end
