class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_set, only: [:index, :create]


  def index
    if current_user.id != @item.id && @item.buy.blank?
       @buy_shipping = BuyShipping.new
    else
       redirect_to root_path
     end
  end

  def create
   # binding.pry
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
       @buy_shipping.save
        redirect_to root_path
    else
        render :index
    end
  end

  private

  def buy_params
    params.require(:buy_shipping).permit(:post_code, :area_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

    def item_set
     @item = Item.find(params[:item_id])
   end
end
