class StargazingsController < ApplicationController

    def index
        @stargazings = Stargazing.all
    end

    def new
        @stargazing = Stargazing.new
    end

    def create 
        @stargazing = Stargazing.new(star_params)
        if @stargazing.save
            redirect_to stargazing_path
            #add flash message
        else
            render :new
        end
    end

        private

        def star_params
            params.require(:stagazing).permit(:location, :weather, :time, :constellation_id)
        end
    end
