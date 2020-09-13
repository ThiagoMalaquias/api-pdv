class Fornecedor < ApplicationRecord
  validates :cnpj, :nome, :telefone, :cpf, :empresa_id, presence: true
end