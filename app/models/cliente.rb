class Cliente < ApplicationRecord
  validates :nome, :email, :telefone, :empresa_id, presence: true
end