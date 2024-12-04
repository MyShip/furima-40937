class OrderAddressForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, 
                :address_line1, :address_line2, :phone_number, :token

  # バリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } # ActiveHashのデフォルト値が0の場合
    validates :municipalities
    validates :address_line1
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Only numbers allowed" }
    validates :token
  end

  # 保存処理
  def save
    # 購入情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
  
    # 住所情報を保存
    Address.create(
      post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities,
      address_line1: address_line1, address_line2: address_line2, 
      phone_number: phone_number, order_id: order.id
    )
  end
end