require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @order_address = FactoryBot.build(:address)
  end
  context '商品の購入ができる時' do
    it 'すべての必須項目が正しく入力されていれば登録できる' do
      expect(@order_address).to be_valid
    end
  end
end
