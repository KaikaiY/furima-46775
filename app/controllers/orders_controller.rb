class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path, notice: '注文しました'
    else
      render :index, status: :unprocessable_entity
    end
  end
end

private

def order_params
  params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
    user_id: current_user.id, item_id: params[:item_id]
  )
end

def set_item
  @item = Item.find(params[:item_id])
end
