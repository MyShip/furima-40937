FactoryBot.define do
  factory :address do
    post_code      { "111-1111" }
    prefecture_id  { 2 }    # ActiveHashで設定されているID
    municipalities { "Sample City" } 
    address_line1  { "1-1-1" }
    address_line2  { "Building 101" }
    phone_number   { "09000000000" }
    token          { "sample_token" }  # tokenを追加
    association :user     # ユーザーとの関連付け
  end
end
