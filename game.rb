class Player
  def get_name()
    name = gets
    @name = name
    return @name
  end
  def get_class()
    player_class = nil
    print "Available classes are:\ncleric\nknight\nrogue\nassassin\n"
    while true
      print "What class do you want to play?: "
      player_class = gets.chomp
      if ["cleric", "knight", "rogue", "assassin"].include? player_class
        system("clear")
        system("cls")
        return player_class
      end
    end
  end
  def customize_class(class_choice)
    case class_choice
    when "knight"
      @hp = 100
      @attack = 10
      @def = 20
      print "Enter 'hp++' to increment your hp (max 10 times): "
      increment_hp = gets.chomp
      system("clear")
      system("cls")
      if increment_hp == "hp++"
        for (maxinc = 0; maxinc >= 10; maxinc++)
          increment_hp = gets
          if increment_hp == "\n"
            @hp += 1
            print "Your total hp: "
            puts @hp
            sleep(0.1)
            system("clear")
            system("cls")
          end
        end
      end
    end
  end


test = Player.new

test.get_name
system("clear")
system("cls")
test.customize_class(test.get_class)
