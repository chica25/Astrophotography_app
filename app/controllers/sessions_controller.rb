class SessionsController < ApplicationController

    def new
    end

    def create
    end

    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end
    
end