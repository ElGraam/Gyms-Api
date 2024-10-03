class EquipmentReservation < ApplicationRecord
  belongs_to :member

  validates :equipment_name, :reservation_time, presence: true
end
