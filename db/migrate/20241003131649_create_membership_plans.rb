class CreateMembershipPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_plans do |t|
      t.string :name, limit: 50, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :duration_in_days

      t.timestamps
    end

    add_index :membership_plans, :name, unique: true
  end
end
