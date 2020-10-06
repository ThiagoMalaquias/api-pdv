class Produto < ApplicationRecord
  validates :nome, :preco, :categorias_id, :empresa_id, presence: true
end