class Guess < ApplicationRecord
  default_scope { order('created_at DESC') }

  belongs_to :game
  has_one :result
end
