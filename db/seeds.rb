# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# プランの作成
monthly_plan = MembershipPlan.find_or_create_by!(name: "月額") do |plan|
  plan.price = 10000.00
  plan.duration_in_days = 30
end

yearly_plan = MembershipPlan.find_or_create_by!(name: "年額") do |plan|
  plan.price = 100000.00
  plan.duration_in_days = 365
end

premium_plan = MembershipPlan.find_or_create_by!(name: "プレミアム") do |plan|
  plan.price = 200000.00
  plan.duration_in_days = 365
end

# ステータスの作成
active_status = MembershipStatus.find_or_create_by!(status_name: "アクティブ")
on_hold_status = MembershipStatus.find_or_create_by!(status_name: "休会中")

# 支払い方法の作成
credit_card = PaymentMethod.find_or_create_by!(method_name: "クレジットカード")
bank_transfer = PaymentMethod.find_or_create_by!(method_name: "銀行振込")

# 会員の作成
member1 = Member.find_or_create_by!(email: "taro.yamada@example.com") do |member|
  member.first_name = "Taro"
  member.last_name = "Yamada"
  member.username = "Yama"
  member.phone_number = "090-1234-5678"
  member.membership_plan = monthly_plan
  member.join_date = Date.today - 30
  member.membership_status = active_status
  member.password = "01your_password"
  member.password_confirmation = "01your_password"
end

member2 = Member.find_or_create_by!(email: "hanako.suzuki@example.com") do |member|
  member.first_name = "Hanako"
  member.last_name = "Suzuki"
  member.username = "Hana"
  member.phone_number = "080-8765-4321"
  member.membership_plan = yearly_plan
  member.join_date = Date.today - 365
  member.membership_status = on_hold_status
  member.password = "02your_password"
  member.password_confirmation = "02your_password"
end

# 利用履歴の作成
UsageHistory.find_or_create_by!(
  member: member1,
  check_in_time: DateTime.now - 1.day,
  check_out_time: DateTime.now - 1.day + 1.hour
)
UsageHistory.find_or_create_by!(
  member: member2,
  check_in_time: DateTime.now - 10.day,
  check_out_time: DateTime.now - 10.day + 1.hour
)

# 支払いの作成
Payment.find_or_create_by!(
  member: member1,
  amount: 10000.00,
  payment_date: DateTime.now - 1.month,
  payment_method: credit_card,
  membership_plan: monthly_plan
)
Payment.find_or_create_by!(
  member: member2,
  amount: 100000.00, 
  payment_date: DateTime.now - 1.year,
  payment_method: credit_card,
  membership_plan: yearly_plan
)

# 設備予約の作成
EquipmentReservation.find_or_create_by!(
  member: member1,
  equipment_name: "ランニングマシン1号機",
  reservation_time: DateTime.now + 1.day
)
EquipmentReservation.find_or_create_by!(
  member: member2,
  equipment_name: "アームブラスター",
  reservation_time: DateTime.now + 1.day
)