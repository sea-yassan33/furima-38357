class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_item, only: %i[show edit update edit destroy]
  before_action :corrent_user, only: %i[edit destroy]
  

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def corrent_user
    if Order.exists?(item_id: @item.id )
      redirect_to items_path
    else @user = @item.user
      return if @user == current_user
      redirect_to(items_path)
    end
  end

end
