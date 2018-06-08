class DodgePackages::CLI

  def call #runs the program
    clear_page
    puts "Welcome to the Dodge Packages Program!"
    pick_car
  end

  def challenger_listing # lists the packages
    @packages = DodgePackages::Package.challenger_available
    @packages.each.with_index(1) do |package, i|
      puts "#{i}. #{package.name}"
    end
  end

  def charger_listing # lists the packages
    @packages = DodgePackages::Package.charger_available
    @packages.each.with_index(1) do |package, i|
      puts "#{i}. #{package.name}"
    end
  end

  def pick_car # picks a vehicle
    puts "Enter a number to select a vehicle to see packages for or type exit to close the program."
    puts <<-DOC.gsub(" ", "")
    1. Challenger
    2. Charger
    DOC
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      if input == "1"
        puts "loading.."
        split_line
        challenger_listing
        selection
      elsif input == "2"
        puts "loading.."
        split_line
        charger_listing
        selection
      elsif input == "exit"
        exit
      else puts "Please enter a valid option."
      end
    end
  end

  def selection #makes a package selection

    input = nil
    while input != "exit"
      puts "-------------------------------------------"
      puts "Enter a number corresponding to a package to view it's features or type exit to close the program."
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 5
        a_package = @packages[input.to_i-1]
        puts "#{a_package.features}"
      elsif input == "exit"
        end_program
        exit
      else
        puts "Please enter a valid option."
      end
    end
  end

  def clear_page
    system "clear"
  end

  def split_line
    puts "-------------------------------------------"
    puts "-------------------------------------------"
  end

  def end_program #ends program
    puts "Thanks for considering Dodge!"
  end
end
