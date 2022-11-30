class Item < ApplicationRecord

	validates :name, presence: true

	has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :bundled_discounts, class_name: 'Discount', foreign_key: 'bundled_discount_id', dependent: :destroy
	has_many :discounts, class_name: 'Discount', foreign_key: 'discounted_item_id', dependent: :destroy
end
