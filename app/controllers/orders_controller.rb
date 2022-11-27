class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
   @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :address,
       :building, :phone_number).merge(order_id: @order.id)
  end

end
