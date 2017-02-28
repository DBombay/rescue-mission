class Answer < ApplicationRecord
  validates :description, presence: true

  validates_length_of :description, :minimum => 50
end
