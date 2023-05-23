require "player"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new(0)}
    (0...14).each do |i|
      @cups[i] = [:stone,:stone,:stone,:stone] if (i != 6 && i != 13)
    end
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if (start_pos < 0 || start_pos > 13)
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = 0
    until stones.empty?
      i += 1
      # if (start_pos + i % 14) == 6
      #   i += 1 if current_player_name == @name2
      # else (start_pos + i % 14) == 13
      #   i += 1 if current_player_name == @name1
      # end
      pos = (start_pos + i) % 14
      # 6 is for player 1, side 1, 13 for 2
      @cups[pos] << stones.shift
    end
    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx % 7 == 6
    return :switch if @cups[ending_cup_idx].empty?
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[6].length < @cups[13].length
      return @name2
    else
      return :draw
    end
  end
end