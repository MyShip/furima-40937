FactoryBot.define do
  factory :order_address_form do
    post_code      { "111-1111" }
    prefecture_id  { 2 }    # ActiveHashで設定されているID
    municipalities { "Sample City" } 
    address_line1  { "1-1-1" }
    address_line2  { "Building 101" }
    phone_number   { "09000000000" }
    token          { "tok_abcdefghijk00000000000000000" }  # tokenを追加
    association :user    # ユーザーとの関連付け
    association :item
  end
end