class StargazingsController < ApplicationController
    # before_action :only []

    # def index
    #     @stargazings = Stargazing.all
    #     # @constellation = Constellation.all
    # end


    def index
        @stargazings = Stargazing.all
    end

    def show
        @stargazing = Stargazing.find(params[:id])
    end

    def new
        @stargazing = Stargazing.new
         @constellations = Constellation.all
    end

    def create 
        @stargazing = Stargazing.new(star_params)
        if @stargazing.save
            redirect_to stargazing_path(@stargazing)
        else
            render :new
        end
    end          # if @stargazing.save
        #     redirect_to stargazing_path
            #add flash message
    #     else
    #         render :new
    #     end
    # end

    def edit
        @stargazing = Stargazing.find(params[:id])
        @constellations = Constellation.all
    end

    def update 
        @stargazing = Stargazing.find(params[:id])
        @stargazing.update(star_params)
        redirect_to stargazing_path(@stargazing)
    end

    private

    def star_params
        params.require(:stargazing).permit(:location, :weather, :time, :constellation_id)
    end
end
