# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = User.create(
        name: "SPFoods Administrateur",
        email: "spfoodadmin@gmail.com",
        password: "admin12345",
        password_confirmation: "admin12345",
        admin: true
      )

user = User.create(
        name: "Invité(e)",
        email: "spfoodinvite@gmail.com",
        password: "invite12345",
        password_confirmation: "invite12345")
