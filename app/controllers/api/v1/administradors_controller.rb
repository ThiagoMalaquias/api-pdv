module Api::V1
  class AdministradorsController < ApplicationController
    def index
      render json: Administrador.all
    end

    def create
      administrador = Administrador.new(administrador_params)

      if administrador.save()
        render json: administrador, status: 200
      else
        render json: { errors: administrador.errors.full_messages}, status: 400
      end
    end

    def update
      administrador = Administrador.find(params[:id])

      if administrador.update(administrador_params)
        render json: administrador, status: 200
      else
        render json: { errors: administrador.errors.full_messages}, status: 400
      end
    end

    def destroy
      administrador = Administrador.find(params[:id])

      if administrador.destroy
        render json: administrador, status: 200
      else
        render json: { errors: administrador.errors.full_messages}, status: 400
      end
    end

    private

    def administrador_params
      params.require(:administrador).permit(:nome, :email, :senha)
    end
  end
end