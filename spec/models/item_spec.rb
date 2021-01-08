require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できる時' do
      it '全てが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが未選択では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'product_condition_idが未選択では登録できない' do
        @item.product_condition_id = 1

        @item.valid?
        expect(@item.errors.full_messages).to include('Product condition must be other than 1')
      end

      it 'shipping_charge_idが未選択では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end

      it 'prefecture_id が未選択では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'day_id が未選択では登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300~¥9,999,999の間空でなければ登録できない' do
        @item.price = 100, 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it '販売価格は半角数字なければ登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
    end
  end
end
