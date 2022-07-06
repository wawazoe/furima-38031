FactoryBot.define do
  factory :item do

    name               {Faker::Lorem.sentence(word_count: 1)}
    text               {Faker::Lorem.sentence}

    area_id            {Faker::Number.between(from: 1, to: 47)}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    condition_id       {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id {Faker::Number.between(from: 2, to: 3)}
    duration_id        {Faker::Number.between(from: 2, to: 4)}
    price              {Faker::Number.between(from: 300, to: 9999999)}

    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
 