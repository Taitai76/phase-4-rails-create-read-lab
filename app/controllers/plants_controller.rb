class PlantsController < ApplicationController
    wrap_parameters format: []

    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find(params[:id])
        if plant
            render json: plant
        else
            render json: { error: "plant not found" }, status: :not_found
        end
    end

    def create
        plant = Plant.create(plants_params)
        render json: plant, status: :created
    end

    private

    def plants_params
        params.permit(:name, :image, :price)
    end
    
end
