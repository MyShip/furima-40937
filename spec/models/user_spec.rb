require 'rails_helper'

RSpec.describe 'Users', type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができる時' do
    it 'すべての必須項目が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー新規登録ができない時' do
    it 'nameが空では登録できない' do
      @user.name = ''
      expect(@user).not_to be_valid
      expect(@user.errors[:name]).to include("can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      expect(@user).not_to be_valid
      expect(@user.errors[:email]).to include("can't be blank")
    end
    it 'emailに@がないと登録できない' do
      @user.email = 'aaa aaa'
      expect(@user).not_to be_valid
      expect(@user.errors[:email]).to include("is invalid")
    end

    it 'emailが一意でないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      expect(another_user).not_to be_valid
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it 'passwordが6文字未満では登録できない' do
      @user.password = @user.password_confirmation = '12345'
      expect(@user).not_to be_valid
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it 'first_name_writeが空では登録できない' do
      @user.first_name_write = ''
      expect(@user).not_to be_valid
    end

    it 'last_name_writeが空では登録できない' do
      @user.last_name_write = ''
      expect(@user).not_to be_valid
    end

    it 'first_name_readingが空では登録できない' do
      @user.first_name_reading = ''
      expect(@user).not_to be_valid
    end

    it 'last_name_readingが空では登録できない' do
      @user.last_name_reading = ''
      expect(@user).not_to be_valid
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      expect(@user).not_to be_valid
    end
  end
end