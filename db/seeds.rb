Tip.destroy_all
Climb.destroy_all
User.destroy_all
p "Removed users, climbs and tips from database."

# User.create!(email: "climbark@gmail.com", username: "Climbark", password: 123456)
User.create!(email: "sandra@climbark.com", username: "Sandra24", password: 123456)
User.create!(email: "jenny@climbark.com", username: "Komezu", password: 123456)
User.create!(email: "nifemi@climbark.com", username: "Nifemi21", password: 123456)
p "Created #{User.count} user(s)!"

User.all.each_with_index do |user, index|
  file = File.open(Rails.root.join("app/assets/images/#{index}.jpg"))
  user.photo.attach(io: file, filename: "#{index}.jpg", content_type: "image/jpg")
end
p "Added photos to users."

Climb.create!([
  {
    status: "completed",
    description: "Here is some description.",
    climb_date: Date.today - 100,
    line: Line.find(43),
    user: User.find_by(username: "Komezu")
  },
  {
    status: "completed",
    description: "Here is some description.",
    climb_date: Date.today - 50,
    line: Line.find(43),
    user: User.find_by(username: "Nifemi21")
  },
  {
    status: "completed",
    description: "I found this one pretty easy, looks like I'm getting better and better at climbing!",
    climb_date: Date.today - 10,
    line: Line.find(1),
    user: User.find_by(username: "Sandra24")
  },
  {
    status: "attempted",
    description: "Definitely a hard 5.9!",
    climb_date: Date.today - 7,
    line: Line.find(99),
    user: User.find_by(username: "Sandra24")
  },
  {
    status: "completed",
    description: "It's not as bad as they make it sound, a great warmup for sure.",
    climb_date: Date.today - 5,
    line: Line.find(69),
    user: User.find_by(username: "Sandra24")
  },
  {
    status: "retreated",
    description: "TOO HARD! :(",
    climb_date: Date.today - 2,
    line: Line.find(9),
    user: User.find_by(username: "Sandra24")
  }
])
p "Created #{Climb.count} climb(s)!"

Tip.create!([
  {
    content: "Be very careful at the tricky corner, easy to lose your footing there!",
    line: Line.find(43),
    user: User.find_by(username: "Komezu")
  },
  {
    title: "Poison Ivy!!",
    content: "Beware of poisonous plants, I saw some poison ivy on my way.",
    line: Line.find(43),
    user: User.find_by(username: "Nifemi21")
  }
])
p "Created #{Tip.count} tip(s)!"

p "=========="
p "Seeding completed."
