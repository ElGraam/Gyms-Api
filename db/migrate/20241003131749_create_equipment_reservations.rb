class CreateEquipmentReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_reservations do |t|
      t.references :member, null: false, foreign_key: true
      t.string :equipment_name, limit: 100, null: false
      t.datetime :reservation_time, null: false

      t.timestamps
    end

    add_index :equipment_reservations, :reservation_time
  end
end
