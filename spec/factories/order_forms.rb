FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { 'テスト都' }
    address { 'テスト町1-1' }
    building { 'テストハイツ' }
    phone_number{ '05012345678' }
  end
end
