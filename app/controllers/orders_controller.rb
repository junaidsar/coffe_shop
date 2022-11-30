class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    if @order.save!
      @order = OrderCreatorService.new(@order, params[:item_ids]).call
      @order.apply_discount!
    end
    render json:  @order.reload
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:customer_name)
  end
end
