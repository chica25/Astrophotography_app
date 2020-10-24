class UsersController < ApplicationController

    #loads the signup form
    def new
        @user = User.new
    end

    def signup    
    end
end
