require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '商品出品情報ができる時' do
    it 'すべての必須項目が正しく入力されていれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品情報ができない時' do
    it '商品名が空では出品できない' do
      @item.user = nil
      expect(@item).not_to be_valid
      expect(@item.errors[:user]).to include("must exist")
    end

    it '商品名が空では出品できない' do
      @item.name = ''
      expect(@item).not_to be_valid
      expect(@item.errors[:name]).to include("can't be blank")
    end
    it '商品の説明が空だと出品できない' do
      @item.explanation = ''
      expect(@item).not_to be_valid
      expect(@item.errors[:explanation]).to include("can't be blank")
    end
    it '商品の画像が空だと出品できない' do
      @item.image = nil
      expect(@item).not_to be_valid
      expect(@item.errors[:image]).to include("can't be blank")
    end
    it '商品のカテゴリーが「---」の状態だと出品できない' do
      @item.category_id = 1
      expect(@item).not_to be_valid
      expect(@item.errors[:category_id]).to include("must be other than 1")
    end
    it '商品の状態が「---」の状態だと出品できない' do
      @item.situation_id = 1
      expect(@item).not_to be_valid
      expect(@item.errors[:situation_id]).to include("must be other than 1")
    end
    it '配送料の負担が「---」の状態だと出品できない' do
      @item.load_id = 1
      expect(@item).not_to be_valid
      expect(@item.errors[:load_id]).to include("must be other than 1")
    end
    it '配送先の地域が「---」の状態だと出品できない' do
      @item.prefecture_id  = 1
      expect(@item).not_to be_valid
      expect(@item.errors[:prefecture_id]).to include("must be other than 1")
    end
    it '配送までの日数が「---」の状態だと出品できない' do
      @item.day_id = 1
      expect(@item).not_to be_valid
      expect(@item.errors[:day_id]).to include("must be other than 1")
    end
    it '商品の値段が空欄だと出品できない' do
      @item.price = ''
      expect(@item).not_to be_valid
      expect(@item.errors[:price]).to include("can't be blank", "is not a number")
    end
    it '商品の値段に半角英数字以外が入力されていると出品できない' do
      @item.price = 'ああ'
      expect(@item).not_to be_valid
      expect(@item.errors[:price]).to include("is not a number")
    end
    it '商品の値段が300より小さいと出品できない' do
      @item.price = '100'
      expect(@item).not_to be_valid
      expect(@item.errors[:price]).to include("must be greater than or equal to 300")
    end
    it '商品の値段が¥9,999,999より大きいと出品できない' do
      @item.price = '10000000000000'
      expect(@item).not_to be_valid
      expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
    end
  end
end
