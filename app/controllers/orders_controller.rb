class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :creata]
  
  def index
    if @item.order != nil
      redirect_to root_path
    end
    @order_address =OrderAddress.new  
  end


  def create
   @order_address = OrderAddress.new(order_params)
  
   if @order_address.valid?
     pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  
 def order_params
   params.permit(:item_id, :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token])
 end


 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],   
        currency: 'jpy'                 
      )
 end

  def move_to_index
    if user_signed_in?
      redirect_to root_path
    else
      redirect_to action: :index

    end
  end

  def set_item
     @item = Item.find(params[:item_id])
  end

end






