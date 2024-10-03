class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name, limit: 100, null: false
      t.string :last_name, limit: 100, null: false
      t.string :email, limit: 100, null: false
      t.string :phone_number, limit: 15
      t.references :membership_plan, null: false, foreign_key: true
      t.date :join_date, null: false
      t.references :membership_status, null: false, foreign_key: true

      t.timestamps
    end

    add_index :members, :email, unique: true
  end
end

