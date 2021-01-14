class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id,  :municipalities, :house_number, :building_name, :phone_number, :token


with_options presence: true do

  validates    :postal_code ,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }   
  validates    :municipalities   
  validates    :house_number     
  validates    :phone_number,    format: { with: /\A\d{11}\z/ }
  validates    :token

  #extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates    :prefecture_id,    numericality: { other_than: 1, message: "can't be blank" }  
end
  
  

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number)
  
  end
end