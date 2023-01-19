class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response


    def create
        signup = Signup.create!({time: params[:time], activity_id: params[:activity_id], camper_id: params[:camper_id]})
        render json: signup.activity, status: :created
    end

    private

    def render_invalid_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
