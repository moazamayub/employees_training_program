class Course < ApplicationRecord
  belongs_to :company

  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :quizzes

  belongs_to :created_by, class_name: "User"

  validates :title, presence: true
end