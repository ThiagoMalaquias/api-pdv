class Administrador < ApplicationRecord
  validates :nome, :email, :telefone, :senha, presence: true
  before_validation :set_token

  def set_token
    self.token = SecureRandom.uuid if self.token.blank?
  end
end