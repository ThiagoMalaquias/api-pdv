module Api::V1
  class EmpresasController < ApplicationController
    def index
      if params[:id].present?
        empresa = Empresa.where(id: params[:id]).first
        empresa = empresa.to_json(:only => [ :id, :nome, :cnpj_cpf])  
        render json: empresa, status: 200
      else
        render json: Empresa.all
      end
    end

    def create
      empresa = Empresa.new(empresa_params)

      if empresa.save()
        render json: empresa, status: 200
      else
        render json: { errors: empresa.errors.full_messages}, status: 400
      end
    end

    def update
      empresa = Empresa.find(params[:id])

      if empresa.update(empresa_params)
        render json: empresa, status: 200
      else
        render json: { errors: empresa.errors.full_messages}, status: 400
      end
    end

    def destroy
      empresa = Empresa.find(params[:id])

      if empresa.destroy
        render json: empresa, status: 200
      else
        render json: { errors: empresa.errors.full_messages}, status: 400
      end
    end

    private

    def empresa_params
      params.require(:empresa).permit(:nome, :cnpj_cpf, :endereco, :bairro, :cep, :estado, :telefone)
    end
  end
end