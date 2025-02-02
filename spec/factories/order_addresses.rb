FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { rand(2..47) } # ランダムな都道府県IDを生成
    area { '東京都' }
    num_of_address { '1-1' }
    building { '東京ハイツ' }
    phone_num { '09012345678' }
    token { Faker::Alphanumeric.alphanumeric(number: 26) } # ランダムなトークンを生成
  end
end
