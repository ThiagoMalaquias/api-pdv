class Funcionario < ApplicationRecord
  validates :nome, :email, :telefone, :cpf, :endereco, :turno, :data_contratacao, :sexo, presence: true
end