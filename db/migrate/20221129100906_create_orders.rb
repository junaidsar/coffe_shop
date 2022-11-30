class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.integer :status
      t.float :total_amount

      t.timestamps
    end
  end
end
