class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :member, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.datetime :payment_date, null: false
      t.references :payment_method, null: false, foreign_key: true
      t.references :membership_plan, null: false, foreign_key: true

      t.timestamps
    end

    add_index :payments, :payment_date
  end
end

