class Empresa < ApplicationRecord
  validates :nome, :cnpj_cpf, :endereco, :bairro, :cep, :estado, :telefone, presence: true
  has_many :funcionarios
end