class Company < ApplicationRecord
  has_many :users
  has_many :departments
  has_many :courses

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["name", "is_active", "created_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end