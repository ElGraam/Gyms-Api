class CreateUsageHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :usage_histories do |t|
      t.references :member, null: false, foreign_key: true
      t.datetime :check_in_time, null: false
      t.datetime :check_out_time

      t.timestamps
    end

    add_index :usage_histories, :check_in_time
  end
end
