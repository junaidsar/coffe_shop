class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.where(status: 'available')
    render json: @items
  end

  def show
  end

  def create
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :type, :tax_rate, :amount, :status)
  end
end
