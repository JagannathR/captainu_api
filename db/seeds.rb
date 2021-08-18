# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Api::V1::Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
# Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
# Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
# Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
# Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
# Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
# Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
# Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)
# Player.create(first_name: "Virat", last_name: "Kohli", height: 5, weight: 75, birthday: "10:11:1993", graduation_year: 2010, position: "batsman", recruit: true)

Tournament.create(name: "IPL", city: "Bengaluru", state: "KA", start_date: "2020-07-18")

Team.create(name: "RCB", age_group: "30", coach: "Simon Keech")

User.create(email: "jagannath@gmail.com", password: "Password1!")

Assessment.create(rating: "2", assessment_type: "test", user_id: 1, tournament_id: 1, player_id: 1)

Note.create(user_id: 1, note: "sample user note", assessment_id: 1)