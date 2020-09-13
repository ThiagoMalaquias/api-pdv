module Api::V1
  class FuncionariosController < ApplicationController
    def index
      render json: Funcionario.all
    end

    def login
      funcionario = Funcionario.where(email: params[:email], cpf: params[:cpf]).first

      if funcionario.present?
        token = Base64.encode64(funcionario[:token])
        funcionario[:token] = token
        funcionario = funcionario.to_json(:only => [ :id, :nome, :email, :cpf, :token, :empresa_id])
        
        render json:  funcionario, status: 200
      else
        render json: {error: "Usuário ou senha inválidos"}, status: 401
      end
    end

    def create
      funcionario = Funcionario.new(funcionario_params)

      if funcionario.save()
        render json: funcionario, status: 200
      else
        render json: { errors: funcionario.errors.full_messages}, status: 400
      end
    end

    def update
      funcionario = Funcionario.find(params[:id])

      if funcionario.update(funcionario_params)
        render json: funcionario, status: 200
      else
        render json: { errors: funcionario.errors.full_messages}, status: 400
      end
    end

    def destroy
      funcionario = Funcionario.find(params[:id])

      if funcionario.destroy
        render json: funcionario, status: 200
      else
        render json: { errors: funcionario.errors.full_messages}, status: 400
      end
    end

    private

    def funcionario_params
      params.require(:funcionario).permit(:nome, :email, :cpf, :admin, :token, :empresa_id)
    end
  end
end