class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  
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
    if @item.user.id != current_user.id
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
   if @item.destroy.id != current_user.id
    redirect_to root_path
  end
 end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id,
                                 :day_id, :price).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
 end

  def set_item
    @item = Item.find(params[:id])
  end
end
