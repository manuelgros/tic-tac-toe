# frozen_string_literal: true

# class for the playing board
class Board
  attr_reader :field

  def initialize
    @field = Array(1..9)
  end

  def display_board
    puts ''
    puts " #{@field[0]} | #{@field[1]} | #{@field[2]} "
    puts '---+---+---'
    puts " #{@field[3]} | #{@field[4]} | #{@field[5]} "
    puts '---+---+---'
    puts " #{@field[6]} | #{@field[7]} | #{@field[8]} "
    puts ''
  end

  def update_board(position, symbol)
    @field[@field.index(position)] = symbol
  end

  def check_for_win_or_full
    if @field[0..1].all? { |s| s == @field[2] } ||
       @field[3..4].all? { |s| s == @field[5] } ||
       @field[6..7].all? { |s| s == @field[8] } ||
       [@field[0], @field[4]].all? { |s| s == @field[8] } ||
       [@field[2], @field[4]].all? { |s| s == @field[6] } ||
       [@field[0], @field[3]].all? { |s| s == @field[6] } ||
       [@field[1], @field[4]].all? { |s| s == @field[7] } ||
       [@field[2], @field[5]].all? { |s| s == @field[8] }
      puts 'Player won!!!'
      true
    elsif @field[0..8].all? { |s| %w[X O].include?(s) }
      puts 'No more moves. Looks like a draw'
      true
    end
  end
end
