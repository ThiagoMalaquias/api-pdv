module Api
  module V1
    class FornecedoresController < ApplicationController
      def index
        render json: Fornecedor.all
      end

      def create
        fornecedor = Fornecedor.new(Fornecedor_params)

        if fornecedor.save()
          render json: fornecedor, status: 200
        else
          render json: { errors: fornecedor.errors.full_messages}, status: 400
        end
      end

      def update
        fornecedor = Fornecedor.find(params[:id])

        if fornecedor.update(Fornecedor_params)
          render json: fornecedor, status: 200
        else
          render json: { errors: fornecedor.errors.full_messages}, status: 400
        end
      end

      def destroy
        fornecedor = Fornecedor.find(params[:id])

        if fornecedor.destroy
          render json: fornecedor, status: 200
        else
          render json: { errors: fornecedor.errors.full_messages}, status: 400
        end
      end

      private

      def Fornecedor_params
        params.require(:fornecedor).permit(:nome, :email, :telefone, :cpf, :endereco, :turno, :data_contratacao, :sexo)
      end
      
    end
  end
end