class Administrador < ApplicationRecord
  validates :nome, :email, :telefone, :senha, presence: true
end