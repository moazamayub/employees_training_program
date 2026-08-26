class Quiz < ApplicationRecord
  belongs_to :course
  has_many :slides, dependent: :destroy

  validates :title, presence: true
end