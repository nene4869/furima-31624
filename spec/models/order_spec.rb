require 'rails_helper'
RSpec.describe Cash, type: :model do
  describe '商品購入機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '購入できる時' do
      it '全てが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '購入できないとき' do
      it 'card_numberが空では登録できない' do
        @item.card_number = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end

      it 'expiration_dateが空では登録できない' do
        @item.expiration_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end

      it 'security_codeが未選択では登録できない' do
        @item.security_code = 
        @item.valid?
        expect(@item.errors.full_messages).to include('')
      end

      it 'では登録できない' do
        @item. = 

        @item.valid?
        expect(@item.errors.full_messages).to include('')
      end

      it 'shipping_charge_idが未選択では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end

      it 'prefecture_id が未選択では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
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

      it 'priceが300より低いと登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9999999より高いと登録できない'do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

    it '販売価格に英字が含まれていると登録できない'do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end


      it '販売価格は半角数字なければ登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
    end
  end
end


