class MembershipStatus < ApplicationRecord
  has_many :members

  validates :status_name, presence: true, uniqueness: true
end
