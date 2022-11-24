require "json"
require "open-uri"

Climb.destroy_all
Line.destroy_all
Area.destroy_all
User.destroy_all
p "Cleaned up database."

User.create!(email: "climbark@gmail.com", username: "climbark", password: 123456)
p "Created an user!"

area_lines_data = JSON.parse(File.read("db/areas_lines_north.json"))

area_lines_data.each do |area|
  if area["lines"].empty?
    p "Skipped #{area['name']} as it has no lines."
    next
  end

  new_area = Area.new(name: area["name"])
  new_area.save!
  p "Created area #{new_area.name}."

  area["lines"].each do |line|
    new_line = Line.new(
      name: line["name"],
      grade: line["grade"],
      category: line["category"],
      description: line["description"],
      location: line["location"],
      protection: line["protection"],
      area: new_area
    )
    new_line.save

    next if line["photo_url"].nil? || !new_line.persisted?

    line_photo_file = URI.open(line["photo_url"])
    new_line.photo.attach(io: line_photo_file, filename: "#{line['name']}.jpg", content_type: "image/jpg")
  end
  p "Created #{new_area.lines.count} line(s) for #{new_area.name}."

  if new_area.lines.empty?
    new_area.destroy
    p "Destroyed #{new_area.name} as it has no valid lines."
  end

  next if area["photo_url"].nil? || new_area.destroyed?

  photo_file = URI.open(area["photo_url"])
  new_area.photo.attach(io: photo_file, filename: "#{area['identifier']}.jpg", content_type: "image/jpg")
  p "Attached photo to #{new_area.name}"
end

p "Created #{Area.count} areas in total!"
p "Created #{Line.count} lines in total!"

p "=========="
p "Seeding completed."
