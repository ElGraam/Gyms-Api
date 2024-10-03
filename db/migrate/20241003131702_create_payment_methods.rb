class CreatePaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_methods do |t|
      t.string :method_name, limit: 50, null: false

      t.timestamps
    end

    add_index :payment_methods, :method_name, unique: true
  end
end
