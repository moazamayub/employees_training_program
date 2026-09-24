class Slide < ApplicationRecord
  belongs_to :quiz
  has_many :slide_questions, dependent: :destroy

  validates :title, presence: true
end