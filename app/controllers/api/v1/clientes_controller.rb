module Api::V1
  class ClientesController < ApplicationController
    def index
      if params[:empresa_id].present?
        clientes = Cliente.where(empresa_id: params[:empresa_id])
        clientes = clientes.to_json(:only => [ :id, :nome, :email, :telefone]) 
        render json: clientes, status: 200
      elsif params[:id].present?
        cliente = Cliente.where(id: params[:id]).first
        cliente = cliente.to_json(:only => [ :id, :nome, :email, :telefone])  
        render json: cliente, status: 200
      else
        render json: Cliente.all
      end
    end

    def create
      cliente = Cliente.new(cliente_params)

      if cliente.save()
        render json: cliente, status: 200
      else
        render json: { errors: cliente.errors.full_messages}, status: 400
      end
    end

    def update
      cliente = Cliente.find(params[:id])

      if cliente.update(cliente_params)
        render json: cliente, status: 200
      else
        render json: { errors: cliente.errors.full_messages}, status: 400
      end
    end

    def destroy
      cliente = Cliente.find(params[:id])

      if cliente.destroy
        render json: cliente, status: 200
      else
        render json: { errors: cliente.errors.full_messages}, status: 400
      end
    end

    private

    def cliente_params
      params.require(:cliente).permit(:nome, :email , :telefone, :empresa_id)
    end
  end
end