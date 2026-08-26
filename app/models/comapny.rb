class Company < ApplicationRecord
  has_many :users
  has_many :departments
  has_many :courses

  validates :name, presence: true
end