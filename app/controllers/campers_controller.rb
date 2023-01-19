class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    def index
        campers = Camper.all
        render json: campers, status: 200
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitySerializer, status: 200
    end

    def create
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end

    private

    def find_camper
        Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end

    def render_invalid_response(exception)
        render json: { errors: exception.errors.full_message }, status: :unprocessable_entity
    end

end
