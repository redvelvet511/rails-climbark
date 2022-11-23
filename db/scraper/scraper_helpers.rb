def scrape_line_details(line_url)
  line_file = URI.open(line_url).read
  line_doc = Nokogiri::HTML(line_file)
  desc_loc_proc = line_doc.search(".fr-view").map { |element| element.text.strip }

  {
    name: line_doc.search("h1").text.strip,
    grade: line_doc.search(".inline-block .rateYDS").text.strip.split.first,
    category: line_doc.search(".description-details tr").first.search("td").last.text.strip.split(", ").first.downcase,
    description: desc_loc_proc[0],
    location: desc_loc_proc[1],
    protection: desc_loc_proc[2],
    url: line_url
  }
end

def scrape_lines(parent_area_doc)
  parent_area_doc.search("#left-nav-route-table td a").map do |line|
    line_url = line.attribute("href").value
    scrape_line_details(line_url)
  end
end

def scrape_subareas_lines(area_doc)
  lines = area_doc.search(".lef-nav-row a").map do |subarea|
    subarea_url = subarea.attribute("href").value
    subarea_html = URI.open(subarea_url).read
    subarea_doc = Nokogiri::HTML(subarea_html)
    scrape_lines(subarea_doc)
  end

  lines.flatten
end

def scrape_photo_url(photo_page_node)
  photo_page_url = photo_page_node.attribute("href").value
  photo_page_file = URI.open(photo_page_url).read
  photo_page_doc = Nokogiri::HTML(photo_page_file)

  large_photo_node = photo_page_doc.search("#expand-href").attribute("href")

  if large_photo_node
    large_photo_node.value
  else
    photo_page_doc.search(".main-photo").attribute("src").value
  end
end
