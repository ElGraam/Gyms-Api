class CreateMembershipStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_statuses do |t|
      t.string :status_name, limit: 50, null: false

      t.timestamps
    end

    add_index :membership_statuses, :status_name, unique: true
  end
end
