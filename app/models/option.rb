class Option < ApplicationRecord
  belongs_to :slide_question

  validates :option_text, presence: true
end