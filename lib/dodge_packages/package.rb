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

  def self.scrape_dodge_first_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))

    package = self.new
    package.name = doc.search("h4").first.text.split("\u00AE").join
    package.features = doc.search("#feature_panel").text
    package
  end

  def self.sanitize_message #helper method
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))
    message_fix = doc.search("div.blurb-title").text
    message_fix = message_fix.gsub!("\u00AE", "")
    message_fix = message_fix.gsub!("\u00A0", ", ")
    message_fix = message_fix.gsub!(" ,",", ")
    message_fix = message_fix.chomp(", ")
    message_fix = message_fix.gsub!(",  ", ", ")
  end

  def self.scrape_dodge_second_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))

    package = self.new
    package.name = doc.search("h4")[1].text
    package.features = sanitize_message
    package
  end

  def self.scrape_dodge_third_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))

    package = self.new
    package.name = doc.search("h4")[2].text
    # package.features =
    package
  end

    def self.scrape_dodge_fourth_package
    doc = Nokogiri::HTML(open("https://www.dodge.com/challenger/packages.html"))

    package = self.new
    package.name = doc.search("h4")[3].text
    # package.features =
    package
  end
end

