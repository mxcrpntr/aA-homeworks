require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    if show_sequence == require_sequence
      round_success_message
      @sequence_length += 1
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    seq
  end

  def require_sequence
    print "Please enter the sequence of colors separated by spaces: \n"
    guess = gets.chomp.split(" ")
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    print "You've won the round! \n"
  end

  def game_over_message
    print "Game over! \n"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end