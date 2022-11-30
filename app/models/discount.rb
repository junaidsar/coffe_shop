class Discount < ApplicationRecord
	belongs_to :bundled_item, class_name: 'Item', foreign_key: 'bundled_discount_id', optional: true
	belongs_to :discounted_item, class_name: 'Item', foreign_key: 'discounted_item_id', optional: true
end
