require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品/item情報' do
    context 'item登録_成功' do
      it '条件を満たしている場合_登録可' do
        expect(@item).to be_valid
      end
    end

    context 'item登録_失敗' do
      it 'imageが空_登録不可(= image必須)' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空_登録不可(= name必須)' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空_登録不可(= description必須)' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryが空_登録不可(= category必須)' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'conditionが空_登録不可(= condition必須)' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'deliveryが空_登録不可(= delivery必須)' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end

      it 'prefectureが空_登録不可(= prefecture必須)' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_dayが空_登録不可(= shipping_day必須)' do
        @item.shipping_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'priceが空_登録不可(= price必須)' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end

  describe '' do
    context 'item登録_失敗' do
    end

    context 'item登録_失敗' do
    end
  end
end
