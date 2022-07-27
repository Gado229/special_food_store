FactoryBot.define do

  factory :food,class: Food do
    name { "Riz a gras" }
    description { "De chez nous" }
    price { '2000' }
    user_id {1}
    id {1}
  end

  factory :food1 ,class: Food do
    name { "Pate blanche" }
    description { "Nouriture locale" }
    price { '5000' }
    user_id {1}
    id {2}
  end

  factory :food2 ,class: Food do
    name { "Pate noire" }
    description { "Nouriture du sud-Bénin" }
    price { '2500' }
    user_id {1}
    id {3}
  end

  factory :food3 ,class: Food do
    name { "Piron" }
    description { "Nuriture de l'Ouest-Bénin" }
    price { '3000' }
    user_id {1}
    id {4}
  end

end
