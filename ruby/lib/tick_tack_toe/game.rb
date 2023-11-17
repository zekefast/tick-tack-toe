# frozen_string_literal: true

class ::TickTackToe::Game
  # @!attribute [r] board
  #   @return [::TickTackToe::Board]
  # @!attribute [r] playes
  #   @return [Array<::TickTackToe::Player>]
  attr_reader \
    :board,
    :players


  # @param board   [::TickTackToe::Board]
  # @param players [Array<::TickTackToe::Player>]
  #
  # @return [void]
  def initialize(board, players)
    @board   = board
    @players = players
  end

  # @return [::TickTackToe::Player, nil] winner of the game, otherwise - nil
  #   (draw game).
  #
  # @yieldparam player [::TickTackToe::Player]
  # @yieldreturn [::TickTackToe::Position]
  def move
    players.cycle.each_with_index do |player, move_counter|
      position = yield(player)
      @board.set(position, player.mark)

      if won?(player, position)
        return player
      elsif final_move?(move_counter)
        return nil
      end
    end
  end

  # @param player     [::TickTackToe::Player]
  # @param new_move_position   [::TickTackToe::Position]
  #
  # @return [Boolean]
  def won?(player, new_move_position)
    checked_lines(new_move_position).any? do |line|
      line.all? do |line_position|
        @board.get(line_position) == player.mark
      end
    end
  end

  # @param counter [Integer]
  #
  # @return [Boolean]
  def final_move?(counter)
    counter >= ((@board.size**2) - 1)
  end

  # GOTCHA: As we have to use reverse range for calculation of right top to
  #   left bottom diagonal in #checked_lines method and Ruby for some reason
  #   does not handle reverse ranges properly we refine Ruby behaviour
  #   regarding Ranges.
  using ::TickTackToe::Util::ReverseRange

  def checked_lines(position) # rubocop:disable Metrics/AbcSize
    lines = [
      # Check vertical containing a cell with recent move of the player
      positions(position.x, 0...@board.size),
      # Check horizontal containing a cel with recent move of the player
      positions(0...@board.size, position.y),
    ]

    # Check top left to right bottom diagonal only if there were a move which
    # belongs to it.
    lines << positions(0...@board.size, 0...@board.size) if belongs_to_major_diagonal?(position)
    # Check top right to left bottom diagonal only if there were a move which
    # belongs to it.
    lines << positions(@board.size.pred..0, 0...@board.size) if belongs_to_minor_diagonal?(position)

    lines
  end

  # Check whether position belongs to top left to right bottom diagonal.
  #
  # @param position [::TickTackToe::Position]
  #
  # @return [Boolean]
  def belongs_to_major_diagonal?(position)
    position.x == position.y
  end

  # Check whether position belongs to top right to left bottom diagonal.
  #
  # @param position [::TickTackToe::Position]
  #
  # @return [Boolean]
  def belongs_to_minor_diagonal?(position)
    position.x + position.y == @board.size.pred
  end

  # @param x [Fixnum, Range]
  # @param y [Fixnum, Range]
  #
  # @return [Enumerator<::TickTackToe::Position>]
  def positions(x, y) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    if x.is_a?(Integer) && y.is_a?(Integer)
      # GOTCHA: as #positions method is intended to generate lines this
      #   particular branch does not used, but put here for unified behaviour
      #   of the method.
      return Enumerator.new { |yielder| yielder << ::TickTackToe::Position.new(x, y) }
    end

    if x.is_a?(Integer)
      Enumerator.new do |yielder|
        y.each { |j| yielder << ::TickTackToe::Position.new(x, j) }
      end
    elsif y.is_a?(Integer)
      Enumerator.new do |yielder|
        x.each { |i| yielder << ::TickTackToe::Position.new(i, y) }
      end
    else
      j = y.each
      Enumerator.new do |yielder|
        x.each { |i| yielder << ::TickTackToe::Position.new(i, j.next) }
      end
    end
  end
end
