class UsersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    before_action :set_user, only: [:show, :edit]

    #loads the signup form

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    #signup 
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
        #  flash.now[:message] = "You're in!"
          redirect_to root_path
        else
            # flash.now[:message] = "Please try again"
            render :new
        end
    end

    def edit
        set_user
    end

    def update
        set_user
        @user = User.find_by_id(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        set_user 
        @user.delete
        redirect_to signup_path
        # flash.now[:error] => "You have successfully deleted your account!"
    end  
        
    private
    def user_params
        params.require(:user).permit(:username, :password, :profile_image, :bio)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end
end

