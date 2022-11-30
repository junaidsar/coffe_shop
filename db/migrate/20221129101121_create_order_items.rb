class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.float :price
      t.boolean :discount_applied, default: false
      t.float :tax

      t.timestamps
    end
  end
end
