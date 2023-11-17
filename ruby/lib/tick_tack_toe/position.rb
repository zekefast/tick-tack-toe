# frozen_string_literal: true

# Pair of x and y coordinates on the board.
class ::TickTackToe::Position
  # @!attribute [r] x
  #   @return [Integer]
  # @!attribute [r] y
  #   @return [Integer]
  attr_reader \
    :x,
    :y


  # @param x [Integer]
  # @param y [Integer]
  #
  # @return [void]
  def initialize(x, y)
    @x = x
    @y = y
  end
end
