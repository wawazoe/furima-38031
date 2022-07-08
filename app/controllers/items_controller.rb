class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
   @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

 def edit  
      @item = Item.find(params[:id])
      unless user_signed_in?
      redirect_ to action: :index
   end
end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :area_id, :category_id, :condition_id, :delivery_charge_id, :duration_id, :price, :user,).merge(user_id: current_user.id)
  end



end
