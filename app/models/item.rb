class Item < ApplicationRecord
  with_options presence: true do
    validates   :name
    validates   :description
    validates   :price
    validates   :image
  end

  validates   :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  validates   :price, numericality: {greater_than_or_equal_to: 300 }
  validates   :price, numericality: {less_than_or_equal_to: 9_999_999}
   
  has_one :order  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day
 

  validates :description, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_charge_id
    validates :day_id
    validates :prefecture_id
  end

  
   
  
end
