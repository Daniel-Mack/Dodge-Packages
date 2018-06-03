require 'pry'
class DodgePackages::Package
  attr_accessor :name, :interior, :exterior, :url

  def self.today
    # puts <<-DOC.gsub!(" ", "")
    # 1. Challenger
    # 2. Charger
    # DOC

    package_1 = self.new
    package_1.name = "DODGE CHALLENGER BLACKTOP PACKAGE"
    package_1.interior = "features"
    package_1.exterior  = "features"
    package_1.url = "https://www.dodge.com/challenger/packages.html"

    package_2 = self.new
    package_2.name = "DODGE CHALLENGER R/T CLASSIC PACKAGE"
    package_2.interior = "features"
    package_2.exterior  = "features"
    package_2.url = "https://www.dodge.com/challenger/packages.html"

    package_3 = self.new
    package_3.name = "DODGE CHALLENGER SCAT PACK APPEARANCE GROUP"
    package_3.interior = "features"
    package_3.exterior  = "features"
    package_3.url = "https://www.dodge.com/challenger/packages.html"

     package_4 = self.new
    package_4.name = "DODGE CHARGER BLACKTOP® PACKAGE"
    package_4.interior = "features"
    package_4.exterior  = "features"
    package_4.url = "https://www.dodge.com/challenger/packages.html"

     package_5 = self.new
    package_5.name = "DODGE CHARGER PLUS GROUP"
    package_5.interior = "features"
    package_5.exterior  = "features"
    package_5.url = "https://www.dodge.com/challenger/packages.html"

     package_6 = self.new
    package_6.name = "DODGE CHARGER PREMIUM GROUP"
    package_6.interior = "features"
    package_6.exterior  = "features"
    package_6.url = "https://www.dodge.com/challenger/packages.html"
  end
end
