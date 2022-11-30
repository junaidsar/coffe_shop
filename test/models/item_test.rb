require "test_helper"

class ItemTest < ActiveSupport::TestCase
  
  context 'associations' do
    should have_many(:orders)
    should have_many(:discounts)
    should have_many(:bundled_discounts)
  end

  def setup
    @invalid_item = Item.new(name: nil, type: '', tax_rate: 8, amount: 20, status: 'available')
    @valid_item = Item.new(name: 'Sandwich', type: '', tax_rate: 8, amount: 20, status: 'available')
  end
  
  test "item should be valid" do
    assert @valid_item.valid?
  end

  test "item should be invalid" do
    refute @invalid_item.valid?
    assert_not_nil @invalid_item.errors[:name], "can't be blank"
  end
end
