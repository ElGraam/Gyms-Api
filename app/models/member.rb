class Member < ApplicationRecord
  belongs_to :membership_plan
  belongs_to :membership_status

  has_many :usage_histories, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :equipment_reservations, dependent: :destroy


  validates :first_name, :last_name, :email, :join_date, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
end
