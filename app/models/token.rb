class Token < ApplicationRecord
  validates :nome, presence: true
end