module Api::V1
  class ProdutosController < ApplicationController
    def index
      if params[:empresa_id].present?
        produtos = Produto.where(empresa_id: params[:empresa_id])
        produtos = produtos.to_json
        render json: produtos, status: 200
      elsif params[:id].present?
        produto = Produto.where(id: params[:id]).first
        produto = produto.to_json
        render json: produto, status: 200
      elsif params[:codigo_produto].present?
        produto = Produto.where(codigo_produto: params[:codigo_produto]).first
        produto = produto.to_json
        render json: produto, status: 200      
      elsif params[:nome].present?
        produto = Produto.where(nome: params[:nome]).first
        produto = produto.to_json
        render json: produto, status: 200           
      else
        render json: Produto.all
      end
    end

    def create
      produto = Produto.new(produto_params)

      if produto.save()
        render json: produto, status: 200
      else
        render json: { errors: produto.errors.full_messages}, status: 400
      end
    end

    def update
      produto = Produto.find(params[:id])

      if produto.update(produto_params)
        render json: produto, status: 200
      else
        render json: { errors: produto.errors.full_messages}, status: 400
      end
    end

    def destroy
      produto = Produto.find(params[:id])

      if produto.destroy
        render json: produto, status: 200
      else
        render json: { errors: produto.errors.full_messages}, status: 400
      end
    end

    private

    def produto_params
      params.require(:produto).permit(:nome,:codigo_produto :preco,:qtd_estoque,:imagem, :fornecedores_id, :categorias_id, :empresa_id)
    end


  end
end