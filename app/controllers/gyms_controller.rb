class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response


    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        render json: {}, status: :no_content
    end

    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def update
        gym = Gym.find(params[:id])
        gym.update!(gym_params)
        render json: gym, status: :ok
    end

    private

    def not_found_response
        render json: {error: "Gym not found"}, status: :not_found
    end

    def gym_params
        params.permit(:name, :address)
    end

    def unprocessable_entity_response(invalid)
        render json: {errors: invalid}, status: :unprocessable_entity
    end
end
