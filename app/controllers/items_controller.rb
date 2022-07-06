class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
   # @items = Item.order("created_at DESC")    商品一覧機能の時に必要
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :area_id, :category_id, :condition_id, :delivery_charge_id, :duration_id, :price, :user,).merge(user_id: current_user.id)
  end



end
