class UsageHistory < ApplicationRecord
  belongs_to :member

  validates :check_in_time, presence: true
  validate :check_out_after_check_in

  private

  def check_out_after_check_in
    if check_out_time.present? && check_out_time < check_in_time
      errors.add(:check_out_time, "はチェックイン時間より後でなければなりません")
    end
  end
end
