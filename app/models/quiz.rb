class Quiz < ApplicationRecord
  belongs_to :course
  has_many :slides, dependent: :destroy

  validates :title, presence: true
  validates :passing_score, numericality: { in: 0..100 }, allow_nil: true
end