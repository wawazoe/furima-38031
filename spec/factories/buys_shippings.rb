FactoryBot.define do
  factory :buy_shipping do
    post_code       {"444-1221"}
    area_id         {30}
    municipalities  {"和歌山市"}
    address         {"一丁目"}
    building_name   {"和歌山ビル"}
    phone_number    {"19012345678"}
    token           {"tok_abcdefghijk00000000000000000"}
  end
end



