# frozen_string_literal: true

require './player'
require './board'

# Class for the game
class Game
  @@player_selection = [true, false].sample

  def initialize
    @board = Board.new
    @player1 = Player.new(1, 'X')
    @player2 = Player.new(2, 'O')
  end

  def self.start_game
    g = Game.new
    g.play_round
  end

  def select_player
    if @@player_selection == true
      @player1
    else
      @player2
    end
  end

  def player_move(selected_player)
    puts "#{selected_player.name}'s turn. Choose a field: "
    player_choice = gets.chomp.to_i
    until selection_valid?(player_choice)
      puts 'Unvalid selection, please select a free field with 1 to 9'
      player_choice = gets.chomp.to_i
    end
    @board.update_board(player_choice, selected_player.symbol)
  end

  def selection_valid?(choice)
    @board.field.include?(choice) && (choice != 'X' || choice != 'O')
  end

  def play_round
    @board.display_board
    until @board.check_for_win_or_full
      player_move(select_player)
      @board.display_board
      @@player_selection = !@@player_selection
    end
    play_again
  end

  def play_again
    puts 'Play again? Y / N'
    if gets.chomp.upcase == 'Y'
      Game.start_game
    else
      puts 'Thanks for playing! Bye.'
      exit
    end
  end
end

Game.start_game
