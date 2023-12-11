# frozen_string_literal: true

# Class for Player
class Player
  attr_reader :name, :symbol

  def initialize(number, symbol)
    @number = number
    puts "#{@number}. Player's Name:"
    @name = gets.chomp
    @symbol = symbol
    puts "\n#{@number}. Player: #{@name} | Symbol: #{@symbol}"
    puts ''
  end
end
