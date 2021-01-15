class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update,:destroy]
  
  
  def index
    @items = Item.all.order(created_at: :desc)
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
   end

  def edit
    if @item.user.id != current_user.id || @item.order != nil
      redirect_to action: :index
    end
  end

  def update
  if @item.update(item_params)
    redirect_to action: :show
  else
    render :edit
  
   end
  end

 def destroy
   if current_user.id == @item.user.id
      @item.destroy
   end
    redirect_to root_path
  end
 


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id,
                                 :day_id, :price).merge(user_id: current_user.id)
  end
  
  

  def set_item
    @item = Item.find(params[:id])
  end
end
