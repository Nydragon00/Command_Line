require 'colorize'

class Player
  def get_name()
    print "Enter the name of your character: "
    name = gets.chomp
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
    @class_choice = class_choice
    case @class_choice
    when "knight"
      @hp = 100
      @ad = 10
      @def = 20
      counter = 10
      while true
        if counter <= 0
          print "You can increment your stats #{counter} times: \n"
          puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}"
          sleep(5)
          break
        end
        print "You can increment your stats #{counter} times: \n"
        puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}"
        increment_stat = gets.chomp
        system("clear")
        system("cls")
        case increment_stat
        when "1"
          @hp += 1
          counter -= 1
        when "2"
          @ad += 1
          counter -= 1
        when "3"
          @def += 1
          counter -= 1
        end
      end
    when "cleric"
      @hp = 150
      @ad = 10
      @def = 10
      counter = 10
      while true
        if counter <= 0
          print "You can increment your stats #{counter} times: \n"
          puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}"
          sleep(5)
          break
        end
        print "You can increment your stats #{counter} times: \n"
        puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}"
        increment_stat = gets.chomp
        system("clear")
        system("cls")
        case increment_stat
        when "1"
          @hp += 1
          counter -= 1
        when "2"
          @ad += 1
          counter -= 1
        when "3"
          @def += 1
          counter -= 1
        end
      end
    when "rogue"
      @hp = 75
      @ad = 20
      @def = 10
      counter = 10
      while true
        if counter <= 0
          print "You can increment your stats #{counter} times: \n"
          puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}"
          sleep(5)
          break
        end
        print "You can increment your stats #{counter} times: \n"
        puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}"
        increment_stat = gets.chomp
        system("clear")
        system("cls")
        case increment_stat
        when "1"
          @hp += 1
          counter -= 1
        when "2"
          @ad += 1
          counter -= 1
        when "3"
          @def += 1
          counter -= 1
        end
      end
    when "assassin"
      @hp = 75
      @ad = 30
      @def = 0
      counter = 10
      while true
        if counter <= 0
          print "You can increment your stats #{counter} times: \n"
          puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}"
          sleep(5)
          break
        end
        print "You can increment your stats #{counter} times: \n"
        puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}"
        increment_stat = gets.chomp
        system("clear")
        system("cls")
        case increment_stat
        when "1"
          @hp += 1
          counter -= 1
        when "2"
          @ad += 1
          counter -= 1
        when "3"
          puts "You cant increase your defense as an assassin."
        end
      end
    end
  end
  def return_player()
    return @name, @class_choice, @hp, @ad, @def
  end
end

class Enemy
  def initialize(enemy_hp, enemy_ad, enemy_def)
    @enemy_hp = enemy_hp
    @enemy_ad = enemy_ad
    @enemy_def = enemy_def
  end
  def print_stats_enemy()
    puts @enemy_hp, @enemy_ad, @enemy_def
  end
  def ret_stats_enemy()
    return @enemy_hp, @enemy_ad, @enemy_def
  end
end

class Intro
  def test(name, class_choice)
    puts "Welcome #{name} the #{class_choice}."
  end
end

class Fight
  def initialize(player_hp, player_ad, player_def, enemy_hp, enemy_ad, enemy_def)
    @php = player_hp
    @pad = player_ad
    @pdef = player_def
    @ehp = enemy_hp
    @ead = enemy_ad
    @edef = enemy_def
  end
  def attack_player()
    damage = @pad - @edef
    crit = damage / @pad
    if damage <= 0
      puts "Your attack has been completely blocked."
    elsif (damage > 0) && (crit > 0.8)
      puts "This was a critical strike. You have dealt #{damage} damage.".red
    elsif damage > 0
      puts "You have dealt #{damage} damage."
    end
  end
end

class Try
  x = Player.new
  y = x.return_player
  @y = y
  def test_function

    puts @y
  end
end

char = Player.new
test_enemy = Enemy.new(100, 10, 5)

stats_enemy = test_enemy.ret_stats_enemy

char.get_name
system("clear")
system("cls")
char.customize_class(char.get_class)

player_character =  char.return_player
#puts player_character[0]

test = Intro.new

test.test(player_character[0], player_character[1])

fight = Fight.new(player_character[2], player_character[3], player_character[4], stats_enemy[0], stats_enemy[1], stats_enemy[2])

fight.attack_player

can = Try.new
puts can.test_function
