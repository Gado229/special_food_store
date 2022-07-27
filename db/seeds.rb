#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

100.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
                email: email,
                password: password,
                )
end

user3 = User.create!(
  email: "gado@example.com",
  password:"123456",
  admin: false,
)

user4 = User.create!(
  email: "gado1@example.com",
  password:"123456",
  admin: false,
)
user5 = User.create!(
  email: "gado2@example.com",
  password:"123456",
  admin: false,
)
user6 = User.create!(
  email: "gado3@example.com",
  password:"123456",
  admin: false,
)
user6 = User.create!(
  email: "gado4@example.com",
  password:"123456",
  admin: true,
)
