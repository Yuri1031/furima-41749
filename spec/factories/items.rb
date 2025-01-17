FactoryBot.define do
  factory :item do
    association :user
    name { 'password123' }
    description { 'password123' }
    price { 1000 }
    category_id { 2 }
    condition_id { 2 }
    delivery_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/files/test_image.png')), filename: 'test_image.png')
    end
  end
end
