class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index,:create]
  before_action :sell_path, only: [:index]

  def index
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(order_params)
    if @order.valid?
      pay_item
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
      :city, :address, :building, :phone_number).merge(user_id: current_user.id,
         item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def sell_path
    if Order.exists?(item_id: @item.id )
      redirect_to items_path
    else @user = @item.user
      return if @user != current_user
      redirect_to(items_path)
    end
  end

end
