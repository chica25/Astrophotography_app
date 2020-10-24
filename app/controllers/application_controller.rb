class ApplicationController < ActionController::Base
     # protect_from_forgery with: :exception
    # protect_from_forgery with: :null_session

     before_action :redirect_if_not_logged_in

    helper_method :current_user, :logged_in?

     def logged_in?
    !!session[:user_id]
    #  current_user
     end

     def redirect_if_not_logged_in
        redirect_to login_path unless logged_in?
     end

    def current_user
         user.find_by(id: session[:user_id]) if session[:user_id]
        #  user.find_by(id: session[:user_id]) if session[:user_id] if session[:user_id]
        #   @current_user ||=user.find_by_id(session[:user_id]) if session[:user_id]
        # @current_user ||=user.find(session[:user_id])
        #if the current user is true it will set it equal to the user in the current session
    end


end