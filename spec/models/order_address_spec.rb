require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  context '内容に問題なし' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題あり' do
    it 'user_idが空では保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では保存できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'token(クレカ情報)が空では保存できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postcode(郵便番号)が空だと保存できない' do
      @order_address.postcode = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcode(郵便番号)が無効な形式だと保存できない' do
      @order_address.postcode = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
    end
    it 'prefecture_id(都道府県)が空だと保存できない' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'area(市区町村)が空だと保存できない' do
      @order_address.area = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'num_of_address(番地)が空だと保存できない' do
      @order_address.num_of_address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Num of address can't be blank")
    end
    it 'phone_num(電話番号)が空だと保存できない' do
      @order_address.phone_num = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
    end
    it 'phone_num(電話番号)が9桁だと保存できない' do
      @order_address.phone_num = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone num must be 10 to 11 digits and only numbers allowed.')
    end
    it 'phone_num(電話番号)が12桁以上だと保存できない' do
      @order_address.phone_num = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone num must be 10 to 11 digits and only numbers allowed.')
    end
  end
end
