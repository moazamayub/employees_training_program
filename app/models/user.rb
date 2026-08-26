class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable



  has_many :user_departments
  has_many :departments, through: :user_departments

  has_many :user_course
  has_many :courses, through: :user_courses
  
  has_many :user_quizzes
  has_many :quizzes, through: :user_quizzes

  enum :role, { employee: 0, teacher: 1, admin: 2, super_admin: 3 }, default: :employee
  enum :status, { invited: 0, active: 1, suspended: 2, archived: 3 }, default: :active


end