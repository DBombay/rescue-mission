class Answer < ApplicationRecord
  validates :description, presence: true
  belongs_to :question

  validates_length_of :description, :minimum => 50

  def self.list
    all.order(updated_at: :desc)
  end
end
