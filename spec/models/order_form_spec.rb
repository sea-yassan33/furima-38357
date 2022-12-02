require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end
    
    context '購入情報が登録される場合' do
      it 'すべての値が正しく入力されていれば登録できること' do
        expect(@order_form).to be_valid
      end
      it 'buildingは空白でも登録ができる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '購入情報が登録されない場合' do
      it 'postal_codeが空の場合は登録されない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角文字列以外は登録されない' do
        @order_form.postal_code = '３４５-５５５５'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが1(---)の場合は登録ができない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空の場合は登録されない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の場合は登録されない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空の場合は登録されない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満は登録されない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberが12桁以上は登録されない' do
        @order_form.phone_number = '123456789112'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが半角数字以外は登録されない' do
        @order_form.phone_number = '090-123-467'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number number is invalid. Input only number")
      end
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
