module Api::V1
  class FuncionariosController < ApplicationController
    def index
      render json: Funcionario.all
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
      params.require(:funcionario).permit(:nome, :email, :telefone, :cpf, :endereco, :turno, :data_contratacao, :sexo)
    end
  end
end