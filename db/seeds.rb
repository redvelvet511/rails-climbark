require 'faker'

Area.destroy_all
User.destroy_all


user = User.new(email: "climbark@gmail.com", username: "climbark", password: 123456)
user.save!
p "created #{User.count} users."

5.times do
  area = Area.new(name: Faker::Nation.capital_city )
  area.save!
end
