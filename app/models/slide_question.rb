class SlideQuestion < ApplicationRecord
  belongs_to :slide
  has_many :options


  
  enum :question_type, { single_choice: 0, multiple_choice: 1, true_false: 2 }, default: :single_choice

  validates :question_text, presence: true
end