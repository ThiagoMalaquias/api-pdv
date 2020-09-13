module Api::V1
  class TokensController < ApplicationController
    def index
      render json: Token.all
    end

    def create
      token = Token.new(token_params)

      if token.save()
        render json: token, status: 200
      else
        render json: { errors: token.errors.full_messages}, status: 400
      end
    end

    def update
      token = Token.find(params[:id])

      if token.update(token_params)
        render json: token, status: 200
      else
        render json: { errors: token.errors.full_messages}, status: 400
      end
    end

    def destroy
      token = Token.find(params[:id])

      if token.destroy
        render json: token, status: 200
      else
        render json: { errors: token.errors.full_messages}, status: 400
      end
    end

    private

    def token_params
      params.require(:token).permit(:nome)
    end
    
  end
end