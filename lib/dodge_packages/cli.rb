class DodgePackages::CLI

  def call #runs the program
    puts "Welcome to the Dodge Packages Program!"
    listing
    selection
    end_program
  end

  def listing # lists the vehicles
    @packages = DodgePackages::Package.available
    @packages.each.with_index(1) do |package, i|
      puts "#{i}. #{package.name}"
    end
  end

  def selection #makes a package selection
    input = nil
    while input != "exit"
      puts "Enter a number corresponding to a package to view it's features, type list to return to the menu or type exit to close the program."
      input = gets.strip.downcase
      if input.to_i > 0
        a_package = @packages[input.to_i-1]
        puts "#{a_package.features}"
      elsif input == "list"
        listing
      elsif input == "exit"
        end_program
        exit
      else
        puts "Please enter a valid option."
      end
    end
  end

  def end_program #ends program
    puts "Program terminating.."
  end
end
