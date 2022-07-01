FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6 )}
    password_confirmation {password}
    birthday              {Faker::Date.birthday}

    first_name            {Faker::Name.initials}
    last_name             {Faker::Name.initials}
    first_kana            {Gimei.first.katakana}
    last_kana             {Gimei.last.katakana}
  end
end 