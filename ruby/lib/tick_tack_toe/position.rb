# frozen_string_literal: true

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
