class OrderCreatorService
	def initialize(order, item_ids)
		@order = order
		@item_ids = item_ids
	end

	def call
		@item_ids.each do |id|
			item = Item.find(id)
			price = item.amount
			tax = (item.tax_rate) * price / 100
			@order.order_items.create(item_id: id, price: price, tax: tax)
		end
		@order.update(total_amount: @order.order_items.sum(:price) + @order.order_items.sum(:tax))
		@order
	end
end