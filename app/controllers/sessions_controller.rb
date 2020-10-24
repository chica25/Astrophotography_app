class SessionsController < ApplicationController

    def new
        @user = User.new
        render :login
    end

    def create
        @user = user.find_by(username: params[:user][:username])
        if @user & @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to users_path(@user)
        else
            #flash.now[:error] = "Wrong login. Please try again."
            render :login
        end
    end

    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end
    
end