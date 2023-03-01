# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

50.times do
  Operation.create(
    amount: Faker::Number.between(from: 1, to: 12000),
    odate: Faker::Date.between(from: "2014-09-23", to: "2023-02-01"),
    description: Faker::Alphanumeric.alphanumeric(number: 100),
    category_id: Faker::Number.between(from: 1, to: 2)
  )
end
