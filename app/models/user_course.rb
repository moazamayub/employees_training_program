class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum :status, { enrolled: 0, in_progress: 1, completed: 2, failed: 3 }, default: :enrolled

  validates :user_id, uniqueness: { scope: :course_id }
end

