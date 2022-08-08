#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user = User.create!(
        name: "SPFoods Administrateur",
        email: "spfoodadmin@gmail.com",
        password: "admin12345",
        admin: true
      )

user2 = User.create!(
        name: "Invité(e)",
        email: "spfoodinvite@gmail.com",
        password: "invite12345"
      )

user3 = User.create!(
  name: "Gado",
  email: "gado@example.com",
  password:"123456",
  admin: false,
)

user4 = User.create!(
  name: "Gado1",
  email: "gado1@example.com",
  password:"123456",
  admin: false,
)
user5 = User.create!(
  name: "Gado2",
  email: "gado2@example.com",
  password:"123456",
  admin: false,
)
user6 = User.create!(
  name: "Gado3",
  email: "gado3@example.com",
  password:"123456",
  admin: false,
)
user7 = User.create!(
  name: "Gado4",
  email: "gado4@example.com",
  password:"123456",
  admin: true,
)

@restaurant = Restaurant.create!(
  name: "Les Capsules",
  adress: "Zopa, près du CS La Grande Academie",
  phone: "96775656"
)

@restaurant1 = Restaurant.create!(
  name: "Chawarma Express",
  adress: "Abomez-calavi, face à l'entrée principale du Campus UAC",
  phone: "96000006"
)

@restaurant2 = Restaurant.create!(
  name: "Chez Tanti",
  adress: "Zopa, près du CS La Grande Academie",
  phone: "96000007"
)

@restaurant3 = Restaurant.create!(
  name: "Chez Maman Gracia",
  adress: "Face au Petit Portail du CEG1 Abomey-calavi",
  phone: "96000008"
)

@restaurant4 = Restaurant.create!(
  name: "Le Chef",
  adress: "Mènontin",
  phone: "96000009"
)

@restaurant5 = Restaurant.create!(
  name: "Le Bénin",
  adress: "Maromilitaire Rue derrière CINÉ LE BENIN",
  phone: "96000010"
)

# restaurant = ['restaurant', 'restaurant1', 'restaurant2', 'restaurant3', 'restaurant4', 'restaurant5']

# description = ['Les Capsules', 'Chawarma Express', 'Chez Tanti', 'Chez Maman Gracia', 'Le Chef', 'Le Bénin']

# @restaurant = Restaurant.create!(
#   name:'A',
#   adress: 'AB',
#   phone: 12345678,
#   user_id:nil,
#   id: 1)

# 10.times do |i|
# Food.create(
#        name: "Pate#{i + 1}",
#  restaurant: @restaurant,    #{}"restaurant#{i + 1}",
# description: "C'est la description du plat#{i + 1}",
#       price: Faker::Number.number(digits: 3) * 100,
#     user_id: rand(2..20)
#   )
# end


@food = Food.create!(
       name: "Pate de maïs",
 restaurant: @restaurant,
description: "C'est la description du plat",
      price: 2000,
    user_id: 2
  )

    @food1 = Food.create!(
                name: "Pate de manioc",
          restaurant: @restaurant1,
         description: "C'est la description du plat1",
               price: 2500,
             user_id: 2
        )

        @food2 = Food.create!(
                    name: "Pate de mil",
              restaurant: @restaurant2,
             description: "C'est la description du plat2",
                   price: 1500,
                 user_id: 3
            )

            @food3 = Food.create!(
                        name: "Pate de farine de manioc",
                  restaurant: @restaurant3,
                 description: "C'est la description du plat3",
                       price: 1000,
                     user_id: 3
                )

                @food4 = Food.create!(
                            name: "Riz au gras",
                      restaurant: @restaurant4,
                     description: "C'est la description du plat4",
                           price: 500,
                         user_id: 4
                    )

                    @food5 = Food.create!(
                                name: "Riz blanc",
                          restaurant: @restaurant5,
                         description: "C'est la description du plat5",
                               price: 1200,
                             user_id: 4
                        )



# users = User.order(:created_at).take (6)
# projects = Project.order(:created_at).take(6)
# 50.times do
#     users.each do |@user|
#         content = Faker::Lorem.sentence(5)
#         projects.each { |project| project.comments.create!(body: content , user_id: @user.id) }
#     end
# end

food_id = ['1', '2', '3', '4', '5', '6']


Comment.create!(
  user_id: user2.id,
  food_id: food_id.sample,
  content: "Je veux commander ce plat"
)

Comment.create!(
  user_id: user2.id,
  food_id: food_id.sample,
  content: "Je suis intéressé par ce plat !"
)

Comment.create!(
  user_id: user3.id,
  food_id: food_id.sample,
  content: "Ça a l'air suculant !"
)

Comment.create!(
  user_id: user3.id,
  food_id: food_id.sample,
  content: "J'ai les lèvres tous mouillés !"
)

Comment.create!(
  user_id: user4.id,
  food_id: food_id.sample,
  content: "Voici mon numéro de téléphone"
)

Comment.create!(
  user_id: user4.id,
  food_id: food_id.sample,
  content: "Miam-miam"
)
