class DodgePackages::Package
  attr_accessor :name, :features

  def self.challenger_available
    challenger_scrape_packages
  end

  def self.charger_available
    charger_scrape_packages
  end

  def self.challenger_scrape_packages
    packages = []
    packages << self.challenger_first_package
    packages << self.challenger_second_package
    packages << self.challenger_third_package
    packages << self.challenger_fourth_package
    packages
  end

  def self.charger_scrape_packages
    packages = []
    packages << self.charger_first_package
    packages << self.charger_second_package
    packages << self.charger_third_package
    packages
  end

  def self.challenger_doc
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))
  end

  #====================Challenger Scraping=====================

  def self.challenger_first_package
    challenger_doc
    package = self.new
    package.name = challenger_doc.search("h4").first.text.split("\u00AE").join
    package.features = challenger_doc.search("#blurb_rail").text.gsub("\u00A0", ", ").gsub("\u00AE", "").chomp(", ")
    package
  end

  def self.challenger_second_package
    challenger_doc
    package = self.new
    package.name = challenger_doc.search("h4")[1].text
    package.features = challenger_doc.search("#blurb_rail_627531141").text.gsub("2016 model shown.", "").gsub("\u00A0", ", ").gsub(" , ", ", ").chomp(", ")
    package
  end

  def self.challenger_third_package
    challenger_doc
    package = self.new
    package.name = challenger_doc.search("h4")[2].text
    package.features = challenger_doc.search("#blurb_rail_595920977").text.gsub("\u00A0", ", ").chomp(", ")
    package
  end

  def self.challenger_fourth_package
    challenger_doc
    package = self.new
    package.name = challenger_doc.search("h4")[3].text
    package.features = challenger_doc.search("div#blurb_rail_595920977_1879983625").text.gsub("\u00AE", ", ").gsub("\u00A0", ", ").gsub(",  ", ", ").chomp(", ")
    package
  end


  #=====================Charger Version=======================

  def self.charger_first_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/charger/packages.html"))
    package = self.new
    package.name = doc.search("h4").first.text.split("\u00AE").join
    package.features = doc.search("#blurb_rail_1997495090").text.gsub("\u00A0", ", ").gsub("\u00C9 ", " ").chomp(", ")
    package
  end

  def self.charger_second_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/charger/packages.html"))
    package = self.new
    package.name = doc.search("h4")[1].text
    package.features = doc.search("#blurb_rail_copy").text.gsub("\u00A0", ", ").gsub(" , ", ", ").chomp(", ")
    package
  end

  def self.charger_third_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/charger/packages.html"))
    package = self.new
    package.name = doc.search("h4")[2].text
    package.features = doc.search("#blurb_rail").text.slice(184..469).gsub("\u00AE ", ", ").gsub("\u2122 ", ", ").gsub("\u00A0", ", ")
    package
  end
end
