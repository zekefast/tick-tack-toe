# frozen_string_literal: true

class ::TickTackToe::Board
  # @!attribute [r] STANDARD_SIZE
  #   @return [Integer]
  STANDARD_SIZE = 3

  # @!attribute [r] EMPTY_CELL
  #   @return [Integer]
  EMPTY_CELL = 0
  # @!attribute [r] CROSS_CELL
  #   @return [Integer]
  CROSS_CELL = 1
  # @!attribute [r] ZERO_CELL
  #   @return [Integer]
  ZERO_CELL  = -1


  # @param size [Integer]
  #
  # @return [void]
  def initialize(size)
    @field = Array.new(size) { Array.new(size, EMPTY_CELL) }
  end

  # @return [Integer]
  def size
    @field.size
  end

  # @param position [::TickTackToe::Position]
  # @param sign     [Integer]
  #
  # @return [self]
  def set(position, sign)
    @field[position.x][position.y] = sign

    self
  end

  # @param position [::TickTackToe::Position]
  #
  # @return [Integer]
  def get(position)
    @field[position.x][position.y]
  end
end
