class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.float :discount_amount
      t.float :discount_percentage
      t.integer :bundled_discount_id
      t.integer :discounted_item_id

      t.timestamps
    end
  end
end
