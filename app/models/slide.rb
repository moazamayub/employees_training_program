class Slide < ApplicationRecord
  belongs_to :quiz
  has_many :slide_questions

  validates :title, presence: true
end