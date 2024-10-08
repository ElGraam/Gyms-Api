class MembershipPlan < ApplicationRecord
  has_many :members
  has_many :payments

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
