Tip.destroy_all
Climb.destroy_all
User.destroy_all
p "Removed users, climbs and tips from database."

User.create!(email: "climbark@gmail.com", username: "Climbark", password: 123456)
User.create!(email: "sandra@climbark.com", username: "Redvelvet", password: 123456)
User.create!(email: "jenny@climbark.com", username: "Komezu", password: 123456)
User.create!(email: "nifemi@climbark.com", username: "Nifemi", password: 123456)
p "Created #{User.count} user(s)!"

Climb.create!([
  {
    status: "completed",
    description: "Here is some description.",
    climb_date: Date.today - 100,
    line: Line.find(105),
    user: User.find_by(username: "Komezu")
  },
  {
    status: "attempted",
    description: "This one is really hard!",
    climb_date: Date.today - 5,
    line: Line.find(7),
    user: User.find_by(username: "Redvelvet")
  },
  {
    status: "retreated",
    description: "Backed down at the third bolt because it was too hard :(",
    climb_date: Date.today - 10,
    line: Line.find(98),
    user: User.find_by(username: "Redvelvet")
  },
  {
    status: "completed",
    description: "Here is some description.",
    climb_date: Date.today - 50,
    line: Line.find(105),
    user: User.find_by(username: "Nifemi")
  }
])
p "Created #{Climb.count} climb(s)!"

Tip.create!([
  {
    content: "Middle part was slippery when I climbed it, be careful.",
    line: Line.find(105),
    user: User.find_by(username: "Komezu")
  },
  {
    title: "Poison Ivy!!",
    content: "Beware of poisonous plants, I saw some poison ivy on my way.",
    line: Line.find(105),
    user: User.find_by(username: "Nifemi")
  }
])
p "Created #{Tip.count} tip(s)!"

p "=========="
p "Seeding completed."
