class Funcionario < ApplicationRecord
  validates :nome, :email, :cpf, :admin, :empresa_id, presence: true
  before_validation :set_token

  def set_token
    self.token = SecureRandom.uuid if self.token.blank?
  end
end