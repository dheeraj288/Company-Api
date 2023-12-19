class Company < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end
