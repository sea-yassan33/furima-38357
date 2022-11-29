class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index,:create]

  def index
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end
  
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, 
      :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
