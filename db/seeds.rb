require "json"

Line.destroy_all
Area.destroy_all

area_lines_data = JSON.parse(File.read("db/areas_lines.json"))

area_lines_data.each do |area|
  if area["lines"].empty?
    p "Skipped #{area["name"]} as it has no lines."
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
  end
  p "Created #{new_area.lines.count} line(s) for #{new_area.name}."

  if new_area.lines.empty?
    new_area.destroy
    p "Destroyed #{new_area.name} as it has no valid lines."
  end
end

p "Created #{Area.count} areas in total!"
p "Created #{Line.count} lines in total!"
