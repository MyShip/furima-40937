require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  describe '購入情報の保存' do
    before do
      # 必要なテストデータを作成
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address_form, user_id: @user, item_id: @item)
      sleep 0.1
    end

    context '保存が成功する場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'address_line2が空でも保存できること' do
        @order_address.address_line2 = ''
        expect(@order_address).to be_valid
      end
    end

    context '保存が失敗する場合' do
      it 'user_idが空の場合は保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空の場合は保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'post_codeが空の場合は保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが「3桁-4桁」の形式でない場合は保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが1の場合は保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空の場合は保存できないこと' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'address_line1が空の場合は保存できないこと' do
        @order_address.address_line1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line1 can't be blank")
      end

      it 'phone_numberが空の場合は保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満の場合は保存できないこと' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Only numbers allowed")
      end

      it 'phone_numberが12桁以上の場合は保存できないこと' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Only numbers allowed")
      end

      it 'phone_numberに数字以外が含まれている場合は保存できないこと' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Only numbers allowed")
      end

      it 'tokenが空の場合は保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end

    context '保存処理の確認' do
      it 'すべての値が正しい場合、OrderとAddressが保存されること' do
        expect{ 
          @order_address.save }.to change { Order.count }.by(1).and change { Address.count }.by(1)
      end
    end
  end
end