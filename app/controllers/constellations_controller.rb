class ConstellationsController < ApplicationController
    before_action :set_cons, only: [:show, :edit, :update, :destroy]

    def index
        @constellations = Constellation.all.sorted
    end

    # def index
    #     @constellations = Constellation.where(:user_id => current_user.id)
    # end


 
    def show
    end

    def new
        @constellation = Constellation.new
    end
    
    def create
        @constellation = Constellation.new(cons_params)
        
        if @constellation.save
            redirect_to constellation_path(@constellation)
        else 
            render :new
        end
    end

        def edit
        end

        def update
            if @constellation.update(cons_params)
                redirect_to constellation_path(@constellation)
            else
                render :edit
            end
        end

        def destroy
            if @constellation.destroy
                redirect_to constellations_path
            else
                flash.now[:error] = "Please try again"
            end
        end

        private

        def cons_params
            params.require(:constellation).permit(:constellation_name, :star_name, :description, :image_url)
        end

        def set_cons
            @constellation = Constellation.find_by_id(params[:id])
        end
    end
