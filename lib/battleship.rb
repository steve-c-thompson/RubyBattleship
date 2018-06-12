
class Battleship
  def self.run
    b = Battleship.new
    b.welcome
  end

  def initialize

  end
  def welcome
    puts "Welcome to BATTLESHIP"
    puts

    options_list
  end

  def options_list
    user_input = ""
    options = ["p", "i", "q"]
    until options.include?(user_input)
      puts "Would you like to (#{options[0]})lay, read the (#{options[1]})nstructions, or (#{options[2]})uit?"
      print "> "
      user_input = gets.chomp
      case user_input.downcase
      when "i"
        puts "Instructions..."
        user_input = "" # reset to stay in loop
      when "q"
        puts "Goodbye"
      when "p"
        init_game
        game_loop
      end
    end
  end

  def game_loop

  end

  def init_game
    # create board

    # create computer player

    # create human player
  end

  # Call the method to place the player's ships
  def place_ships(player, board)

  end

  def take_turn(player, board)

  end
end

Battleship.run
