FactoryBot.define do
  factory :restaurant do
    # sequence(:name) {|n| "name-#{n}"}
    id { 1 }
    name { 'A' }
    adress { 'AB' }
    phone { 12345678 }
    user_id { nil }
  end

  factory :restaurant1 do
    # sequence(:name) {|n| "name-#{n}"}
    id { 2 }
    name { 'B' }
    adress { 'BC' }
    user_id { nil }
  end
end
