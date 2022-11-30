require "test_helper"

class OrderTest < ActiveSupport::TestCase
  
  context 'associations' do
    should have_many(:order_items)
    should have_many(:items)
  end

  describe "#Order" do
    before do
      @first_item = Item.create(name: 'Sandwich', type: '', tax_rate: 8, amount: 20, status: 'available')
      @second_item = Item.create(name: 'Burger', type: '', tax_rate: 8, amount: 20, status: 'available')
    end

    describe "#no_discount_applied" do
      before do
        @order = Order.create(customer_name: 'Test')
        @order = OrderCreatorService.new(@order, [@first_item.id, @second_item.id]).call        
      end

      it "order total should be correct" do
        @order.reload
        assert_equal 43.2, @order.total_amount
      end
    end

    describe "#direct_discount_applied" do
      before do
        @order = Order.create(customer_name: 'test')
        @order = OrderCreatorService.new(@order, [@first_item.id, @second_item.id]).call 
        Discount.create(discount_amount: 5, discount_percentage: nil, bundled_item: nil, discounted_item: @first_item)       
        @order.apply_discount!
      end

      it "order total should be correct" do
        @order.reload
        assert_equal 38.2, @order.total_amount
      end
    end

    describe "#bundled_discount_applied_when_discount_amount_and_discount_percentage_present" do
      before do
        @order = Order.create(customer_name: 'test')
        @order = OrderCreatorService.new(@order, [@first_item.id, @second_item.id]).call 
        Discount.create(discount_amount: 5, discount_percentage: 5, bundled_item: @second_item, discounted_item: @first_item)       
        @order.apply_discount!
      end

      it "order total should be correct" do
        @order.reload
        assert_equal 42.2, @order.total_amount
      end
    end

    describe "#bundled_discount_applied_when_discount_amount_present" do
      before do
        @order = Order.create(customer_name: 'test')
        @order = OrderCreatorService.new(@order, [@first_item.id, @second_item.id]).call 
        Discount.create(discount_amount: 5, discount_percentage: nil, bundled_item: @second_item, discounted_item: @first_item)       
        @order.apply_discount!
      end

      it "order total should be correct" do
        @order.reload
        assert_equal 38.2, @order.total_amount
      end
    end

    describe "#bundled_discount_applied_when_discount_percentage_present" do
      before do
        @order = Order.create(customer_name: 'test')
        @order = OrderCreatorService.new(@order, [@first_item.id, @second_item.id]).call 
        Discount.create(discount_amount: nil, discount_percentage: 10, bundled_item: @second_item, discounted_item: @first_item)       
        @order.apply_discount!
      end

      it "order total should be correct" do
        @order.reload
        assert_equal 41.2, @order.total_amount
      end
    end

  end

end
