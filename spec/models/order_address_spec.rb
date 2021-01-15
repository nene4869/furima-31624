require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      sleep 1
      @order_address = FactoryBot.build(:order_address,item_id: item.id ,user_id: user.id)
    end

    context '購入がうまくいくとき' do
    it 'すべての値が正しく入力されていれば購入できること' do
       expect(@order_address).to be_valid
    end

    it 'building_name は空でも購入できる' do
      @order_address.building_name = ""
      @order_address.valid?
    end

  end

  context '購入がうまくいかないとき' do
    it 'tokenが空だと購入できないこと' do
      @order_address.token = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end


    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeはハイフンがないと保存できないこと' do
      @order_address.postal_code = 000-0000
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefecture_id が未選択では購入できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_id が空では購入できない' do
      @order_address.prefecture_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

  
      it 'municipalitiesが空だと購入できないこと' do
        @order_address.municipalities = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      
      

      it 'house_numberが空だと購入できないこと' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

    
    it 'phone_numberが空だと購入できないこと' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

   it 'phone_mumberはハイフンは不要で、11桁以内であること' do
      @order_address.phone_number = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
   end

   it 'user_idが空だと購入できないこと' do
    @order_address.user_id = ""
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("User can't be blank")
  end

  it 'item_idが空だと購入できないこと' do
    @order_address.item_id = ""
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Item can't be blank")
  end 
 end
end
end



