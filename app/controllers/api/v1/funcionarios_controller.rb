module Api::V1
  class FuncionariosController < ApplicationController
    def index
      if params[:empresa_id].present?
        funcionarios = Funcionario.where(empresa_id: params[:empresa_id])
        funcionarios = funcionarios.to_json(:only => [ :id, :nome, :email, :cpf, :admin]) 
        render json: funcionarios, status: 200
      else
        render json: Funcionario.all
      end
    end

    def login
      funcionario = Funcionario.where(email: params[:email], senha: params[:senha]).first

      if funcionario.present?
        token = Base64.encode64(funcionario[:token])
        funcionario[:token] = token
        funcionarioMap = funcionario.to_json(:only => [ :id, :nome, :admin, :token, :empresa_id])

        render json:  funcionarioMap, status: 200
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
      params.require(:funcionario).permit(:nome, :email, :senha, :cpf, :admin, :token, :empresa_id)
    end
  end
end