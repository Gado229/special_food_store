FactoryBot.define do

  factory :food do
    name { "Riz au gras" }
    description { "De chez nous" }
    price { '2000' }
    restaurant { 1 }
    user_id { 2 }
    id { 1 }
  end

  factory :food1 ,class: Food do
    name { "Pate blanche" }
    description { "Nouriture locale" }
    price { '5000' }
    restaurant { 2 }
    user_id { 4 }
    id { 2 }
  end

  factory :food2 ,class: Food do
    name { "Pate noire" }
    description { "Nouriture du sud-Bénin" }
    price { '2500' }
    restaurant { 2 }
    user_id { 1 }
    id { 3 }
  end

end
