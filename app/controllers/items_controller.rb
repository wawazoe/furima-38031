class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create]


  def index
    @items = Item.order("created_at DESC")
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

  def require_login
       unless user_signed_in?
         redirect_to user_session_path
       end
      end

end
