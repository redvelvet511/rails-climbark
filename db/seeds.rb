Tip.destroy_all
Climb.destroy_all
User.destroy_all
p "Removed users, climbs and tips from database."

User.create!(email: "climbark@gmail.com", username: "climbark", password: 123456)
p "Created an user!"

p "=========="
p "Seeding completed."
