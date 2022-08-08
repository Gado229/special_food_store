#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!
(
        name: "SPFoods Administrateur",
        email: "spfoodadmin@gmail.com",
        password: "admin12345",
        admin: true
      )

user2 = User.create!
(
        name: "Invité(e)",
        email: "spfoodinvite@gmail.com",
        password: "invite12345"
      )

user3 = User.create!
(
  email: "gado@example.com",
  password:"123456",
  admin: false,
)

user4 = User.create!
(
  email: "gado1@example.com",
  password:"123456",
  admin: false,
)
user5 = User.create!
(
  email: "gado2@example.com",
  password:"123456",
  admin: false,
)
user6 = User.create!
(
  email: "gado3@example.com",
  password:"123456",
  admin: false,
)
user6 = User.create!
(
  email: "gado4@example.com",
  password:"123456",
  admin: true,
)

restaurant = Restaurant.create!
(
  name: "Les Capsules",
  adress: "Zopa, près du CS La Grande Academie",
  phone: "96775656"
)

restaurant1 = Restaurant.create!
(
  name: "Chawarma Express",
  adress: "Abomez-calavi, face à l'entrée principale du Campus UAC",
  phone: "96000006"
)

restaurant2 = Restaurant.create!
(
  name: "Chez Tanti",
  adress: "Zopa, près du CS La Grande Academie",
  phone: "96000007"
)

restaurant3 = Restaurant.create!
(
  name: "Chez Maman Gracia",
  adress: "Face au Petit Portail du CEG1 Abomey-calavi",
  phone: "96000008"
)

restaurant4 = Restaurant.create!
(
  name: "Le Chef",
  adress: "Zopa, près du CS La Grande Academie",
  phone: "96000009"
)

restaurant5 = Restaurant.create!
(
  name: "Le Bénin",
  adress: "Maromilitaire Rue derrière CINÉ LE BENIN",
  phone: "96000010"
)

restaurant = ['Les Capsules', 'Chawarma Express', 'Chez Tanti', 'Chez Maman Gracia', 'Le Chef', 'Le Bénin']


50.times do |i|
    Food.create(
        name: "Plat#{i + 1}",
  restaurant: restaurant[rand(3)],
 description: "C'est la description du plat#{i + 1}",
        prix: "2#{i + 500}",
     user_id: rand(2..48)
    )
end
