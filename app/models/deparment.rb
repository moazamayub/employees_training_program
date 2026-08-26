class Department < ApplicationRecord
  belongs_to :company

  has_many :user_departments
  has_many :users, through: :user_departments
  

  validates :name, presence: true
end