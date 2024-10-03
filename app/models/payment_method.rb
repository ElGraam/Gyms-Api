class PaymentMethod < ApplicationRecord
  has_many :payments

  validates :method_name, presence: true, uniqueness: true
end
