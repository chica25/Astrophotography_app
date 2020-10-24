class UsersController < ApplicationController

    #loads the signup form
    def new
        @user = User.new
    end

    #signup 
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
        #  flash.now[:message] = "You're in!"
          redirect_to users_path(@user)
        else
            # flash.now[:message] = "Please try again"
            render :new
        end
    end

        def index
        end
        
    private
    def user_params
        params.require(:user).permit(:username, :password, :profile_image, :bio)
    end
end
