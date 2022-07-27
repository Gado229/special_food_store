FactoryBot.define do
  factory :restaurant do
    sequence(:name) {|n| "name-#{n}"}
    sequence(:adress) {|n| "adress-#{n}"}
    sequence(:phone) {|n| "phone-#{n}"}
  end
end
