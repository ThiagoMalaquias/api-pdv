class Fornecedor < ApplicationRecord
  validates :nome, :email, :telefone, :cpf, :endereco, :sexo, presence: true
end