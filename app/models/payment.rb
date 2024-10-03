class Payment < ApplicationRecord
  belongs_to :member
  belongs_to :payment_method
  belongs_to :membership_plan

  validates :amount, :payment_date, :payment_method, :membership_plan, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
