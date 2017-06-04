class Guess < ApplicationRecord
  belongs_to :game
  has_one :result
end
