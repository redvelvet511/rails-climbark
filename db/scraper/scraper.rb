require "open-uri"
require "nokogiri"
require "json"
require_relative "scraper_helpers"

url = "https://www.mountainproject.com/area/118724037/ontario-north-bouldering-and-rock"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

areas = []

html_doc.search(".lef-nav-row a").each do |element|
  area_url = element.attribute("href").value
  area_identifier = area_url.match(/[0-9]+/)[0].to_i
  areas << { name: element.text.strip, url: area_url, identifier: area_identifier, lines: [] }
end

areas.each do |area|
  area_html = URI.open(area[:url]).read
  area_doc = Nokogiri::HTML(area_html)

  if area_doc.search("#left-nav-route-table td a").empty?
    scrape_subareas_lines(area_doc).each { |line| area[:lines] << line }
  else
    scrape_lines(area_doc).each { |line| area[:lines] << line }
  end
end

File.open("db/areas_lines.json", "wb") do |file|
  file.write(JSON.pretty_generate(areas))
end
