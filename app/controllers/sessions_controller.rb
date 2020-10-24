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

    def omniauth
        @user = user.from_omniauth(auth)
        if @user.valid?
             session[:user_id] = @user.id
             redirect_to root_path   
        else
             redirect_to login_path 
        end
   end

    def destroy
        session.clear
        redirect_to root_path
    end

    protected 

    def auth
        request.env('omniauth.auth')
    end
end