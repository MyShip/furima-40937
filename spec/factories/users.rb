FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name_write { '山田' }
    last_name_write { '太郎' }
    first_name_reading { 'ヤマダ' }
    last_name_reading { 'タロウ' }
    birthday { '1990-01-01' }
  end
end