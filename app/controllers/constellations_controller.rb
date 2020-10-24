class ConstellationsController < ApplicationController

    def index
        @constellations = Constellation.all.sorted
    end











end
