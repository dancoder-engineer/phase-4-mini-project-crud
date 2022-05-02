class SpicesController < ApplicationController
    wrap_parameters format: []

    def index
        render json: Spice.all
    end

    def create
        spice = Spice.create(permitted)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find(params[:id])
        spice.update(permitted)
        render json: spice, status: :created
    end

    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        head :not_found
    end

    private

    def permitted
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
