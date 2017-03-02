class Question < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  # validates_length_of :title, minimum: 40
  # validates_length_of :description, minimum: 150

  has_many :answers, dependent: :destroy

  def self.list
    all.order(updated_at: :desc)
  end
end
