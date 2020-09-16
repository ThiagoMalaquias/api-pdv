class Funcionario < ApplicationRecord
  validates :nome, :email, :senha, :cpf, :admin, :empresa_id, presence: true
  before_validation :set_token
  belongs_to :empresa

  def set_token
    self.token = SecureRandom.uuid if self.token.blank?
  end
end