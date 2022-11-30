class DiscountService
	def initialize(order)
		@order = order
	end

	def call
		@order.order_items.each do |order_item|
			item = order_item.item
			direct_discount = item.discounts.where(bundled_discount_id: nil).first
			apply_discount!(direct_discount, order_item) if direct_discount.present?
			
			bundled_discounts_item_ids = item.bundled_discounts.pluck(:discounted_item_id)
			
			bundled_item = @order.order_items.where(item_id: bundled_discounts_item_ids, discount_applied: false).first
			bundled_discount = item.bundled_discounts.where(discounted_item: bundled_item).first
			apply_discount!(bundled_discount, bundled_item) if bundled_discount.present?
		end
		@order.update(total_amount: @order.order_items.sum(:price) + @order.order_items.sum(:tax))
		@order
	end

	def apply_discount!(discount, order_item)
		discount_applied = 0
		if discount.discount_percentage.present?
			discount_applied = (discount.discount_percentage * order_item.price) / 100.0
			discount_applied = [discount.discount_amount, discount_applied].min if discount.discount_amount.present?
		elsif discount.discount_amount.present?
			discount_applied = discount.discount_amount
		end
		price = order_item.price - discount_applied
		order_item.update(discount_applied: true, price: price)
	end
end