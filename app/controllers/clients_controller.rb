class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

    def show
        client = Client.find(params[:id])
        render json: client, status: :ok
    end

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def update
        client = Client.find(params[:id])
        client.update!(client_params)
        render json: client, status: :ok
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def not_found_response
        render json: {error: "Client(s) not found"}, status: :not_found
    end

    def unprocessable_entity_response(invalid)
        render json: {errors: invalid}, status: :unprocessable_entity
    end
end
