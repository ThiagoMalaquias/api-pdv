class Categoria < ApplicationRecord
  validates :nome, :empresa_id, presence: true
end