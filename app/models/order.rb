class Order < ApplicationRecord

	has_many :order_items
  has_many :items, through: :order_items

  def apply_discount!
  	DiscountService.new(self).call
  end
end
