class Funcionario < ApplicationRecord
  validates :nome, :email, :telefone, :cpf, :endereco, :turno, :data_contratacao, :sexo, presence: true
  before_validation :set_token

  def set_token
    self.token = SecureRandom.uuid if self.token.blank?
  end
end