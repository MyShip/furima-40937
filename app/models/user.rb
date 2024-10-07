class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,               presence: true

  validates :password, format: { 
    with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "は半角英数字混合で入力してください"
  }, allow_nil: true
  
  validates :first_name_write,   presence: true, 
    format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角の日本語で入力してください"
    }
  validates :last_name_write,    presence: true, 
    format: { 
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角の日本語で入力してください"
    }
  validates :first_name_reading, presence: true,
    format: { 
      with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナで入力してください"
    }
  validates :last_name_reading,  presence: true,
    format: { 
      with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナで入力してください"
    }
  validates :birthday,           presence: true
  # has_many  :orders
  # has_many  :items
       
end
