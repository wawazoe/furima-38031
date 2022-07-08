class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :item_set, only: [:show, :edit, :update]

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

  def show
    @user = @item.user
  end

 def edit
  if current_user!=@item.user    
    redirect_to root_path
end
end

   def update
    if @item.update(item_params)
         redirect_to item_path
    else
         render :new
     end
   end





  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :area_id, :category_id, :condition_id, :delivery_charge_id, :duration_id, :price, :user).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

end
