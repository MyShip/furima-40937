FactoryBot.define do
  factory :item do
    name           { "テスト商品" }
    explanation    { "これはテスト商品です。" }
    category_id    { 2 }  # ActiveHashで設定されているID
    situation_id   { 2 }  # ActiveHashで設定されているID
    load_id        { 2 }  # ActiveHashで設定されているID
    prefecture_id  { 2 }  # ActiveHashで設定されているID
    day_id         { 2 }  # ActiveHashで設定されているID
    price          { 500 }
    association :user     # ユーザーとの関連付け
    after(:build) do |item|
      item.image.attach(io: File.open('spec/testimage/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
