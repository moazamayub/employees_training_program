class SlideQuestion < ApplicationRecord
  belongs_to :slide
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true,
    reject_if: proc { |attrs| attrs["option_text"].blank? }

  enum :question_type, { single_choice: 0, multiple_choice: 1, true_false: 2 }, default: :single_choice

  validates :question_text, presence: true
  validate :correct_option_count

  private

  def correct_option_count
    live_options = options.reject(&:marked_for_destruction?)
    correct_count = live_options.count(&:correct?)

    case question_type
    when "single_choice"
      errors.add(:base, "must have exactly one correct option") unless correct_count == 1
    when "true_false"
      errors.add(:base, "must have exactly two options") unless live_options.size == 2
      errors.add(:base, "must have exactly one correct option") unless correct_count == 1
    when "multiple_choice"
      errors.add(:base, "must have at least one correct option") if correct_count.zero?
    end
  end
end
