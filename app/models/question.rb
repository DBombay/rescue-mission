class Question < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  validates_length_of :title, :minimum => 40
  validates_length_of :description, :minimum => 150
end