require 'faker'

Area.destroy_all
User.destroy_all
Line.destroy_all

user = User.new(email: "climbark@gmail.com", username: "climbark", password: 123456)
user.save!
p "created #{User.count} users."

5.times do
  area = Area.create!(
    name: Faker::Nation.capital_city
  )
  area.save!
end
p "created #{Area.count} areas."

rand(3..5).times do
  line = Line.create!(
    name: Faker::Address.street_name,
    grade: Line::GRADES_LIST.sample, category: Line::CATEGORIES.sample,
    description: Faker::Movie.quote,
    area: Area.first
  )
  line.save!
end
p "created #{Line.count} lines."



# 5.times do
#   area = Area.new(
#     name: Faker::Nation.capital_city
#   )
#   area.save!
#   rand(3..5).times do
#     line = Line.new(
#       name: Faker::Address.street_name
#     )
#     line.save!
#   end
# end
