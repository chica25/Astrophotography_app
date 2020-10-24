class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
             session[:user_id] = @user.id
             redirect_to constellations_path(@constellation)
        else
             flash.now[:error] = "Wrong login. Please try again."
             render :new
        end
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
        redirect_to login_path
    end

    protected 

    def auth
        request.env('omniauth.auth')
    end
end