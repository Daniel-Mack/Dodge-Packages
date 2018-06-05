class DodgePackages::Package
  attr_accessor :name, :features

  def self.available
    self.scrape_packages
  end

  def self.scrape_packages
    packages = []
    packages << self.scrape_dodge_first_package
    packages << self.scrape_dodge_second_package
    packages << self.scrape_dodge_third_package
    packages << self.scrape_dodge_fourth_package
    packages
  end

  def self.sanitize_message_first_package #helper method
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))
    message_fix = doc.search("#blurb_rail").text.gsub("\u00A0", ", ")
    message_fix = message_fix.gsub("\u00AE", "").chomp(", ")
  end

  def self.scrape_dodge_first_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))

    package = self.new
    package.name = doc.search("h4").first.text.split("\u00AE").join
    package.features = sanitize_message_first_package
    package
  end

  def self.sanitize_message_second_package #helper method
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))
    message_fix = doc.search("#blurb_rail_627531141").text
    message_fix = message_fix.gsub("2016 model shown.", "")
    message_fix = message_fix.gsub("\u00A0", ", ")
    message_fix = message_fix.gsub(" , ", ", ").chomp(", ")
  end

  def self.scrape_dodge_second_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))

    package = self.new
    package.name = doc.search("h4")[1].text
    package.features = sanitize_message_second_package
    package
  end

  def self.scrape_dodge_third_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))

    package = self.new
    package.name = doc.search("h4")[2].text
    package.features = doc.search("#blurb_rail_595920977").text.gsub("\u00A0", ", ").chomp(", ")
    package
  end

  def self.sanitize_message_fourth_package #helper method
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))
    message_fix = doc.search("div#blurb_rail_595920977_1879983625").text
    message_fix = message_fix.gsub("\u00AE", ", ")
    message_fix = message_fix.gsub("\u00A0", ", ")
    message_fix = message_fix.gsub(",  ", ", ").chomp(", ")
  end

  def self.scrape_dodge_fourth_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))

    package = self.new
    package.name = doc.search("h4")[3].text
    package.features = sanitize_message_fourth_package
    package
  end
end
