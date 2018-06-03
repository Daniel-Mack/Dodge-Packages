class DodgePackages::Package
  attr_accessor :name, :features, :url

  def self.all
    package_1 = self.new
    package_1.name = "DODGE CHALLENGER BLACKTOP PACKAGE"
    package_1.features = "features"
    package_1.url = "https://www.dodge.com/challenger/packages.html"

    package_2 = self.new
    package_2.name = "DODGE CHALLENGER R/T CLASSIC PACKAGE"
    package_2.features = "features"
    package_2.url = "https://www.dodge.com/challenger/packages.html"

    package_3 = self.new
    package_3.name = "DODGE CHALLENGER SCAT PACK APPEARANCE GROUP"
    package_3.features = "features"
    package_3.url = "https://www.dodge.com/challenger/packages.html"

    package_4 = self.new
    package_4.name = "DODGE CHARGER BLACKTOP® PACKAGE"
    package_4.features = "features"
    package_4.url = "https://www.dodge.com/challenger/packages.html"

    package_5 = self.new
    package_5.name = "DODGE CHARGER PLUS GROUP"
    package_5.features = "features"
    package_5.url = "https://www.dodge.com/challenger/packages.html"

    package_6 = self.new
    package_6.name = "DODGE CHARGER PREMIUM GROUP"
    package_6.features = "features"
    package_6.url = "https://www.dodge.com/challenger/packages.html"
    [package_1, package_2, package_3, package_4, package_5, package_6]
  end
end
