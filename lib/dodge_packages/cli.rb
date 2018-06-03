class DodgePackages::CLI

  def call #runs the program
    puts "Welcome to the Dodge Packages Program!"
    listing
    selection
    end_program
  end

  def listing # lists the vehicles
    puts "Select a car to view packages for or type exit to close the program."
    @packages = DodgePackages::Package.today
  end


  def challenger_packages #helper method
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      case input
      when "1"
        puts "Blacktop info"
        puts "Enter another number to see a different package or type exit to quit."
      when "2"
        puts "R/T Classic info"
        puts "Enter another number to see a different package or type exit to quit."
      when "3"
        puts "Scat Pack"
        puts "Enter another number to see a different package or type exit to quit."
      when "exit"
        exit
      else
        puts "Please enter a valid option."
      end
    end
  end

  def charger_packages #helper method
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      case input
      when "1"
        puts "Blacktop info"
        puts "Enter another number to see a different package or type exit to quit."
      when "2"
        puts "Charger Plus info"
        puts "Enter another number to see a different package or type exit to quit."
      when "3"
        puts "Charger Premium info"
        puts "Enter another number to see a different package or type exit to quit."
      when "exit"
        exit
      else
        puts "Please enter a valid option."
      end
    end
  end

  def selection #makes a package selection
     input = nil
     while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Please select a package for the Dodge Challenger to view.  1. Blacktop, 2. R/T Classic, 3. Scat Pack "
        challenger_packages
      when "2"
        puts "Please select a package for the Dodge Charger to view.  1. Blacktop, 2. Plus Group, 3. Premium Group"
        charger_packages
      end
    end
  end

  def end_program #ends program
    puts "Program terminating.."
  end
end
