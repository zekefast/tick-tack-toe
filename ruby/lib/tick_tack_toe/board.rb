# frozen_string_literal: true

class ::TickTackToe::Board
  # @!attribute [r] STANDARD_SIZE
  #   @return [Integer]
  STANDARD_SIZE = 3


  # @param size [Integer]
  #
  # @return [void]
  def initialize(size)
    @field = Array.new(size) { Array.new(size, ::TickTackToe::EMPTY_BOARD_CELL_MARK) }
  end

  # @return [Integer]
  def size
    @field.size
  end

  # @param position [::TickTackToe::Position]
  #
  # @return [Boolean]
  def free?(position)
    get(position) == ::TickTackToe::EMPTY_BOARD_CELL_MARK
  end

  # @param position [::TickTackToe::Position]
  #
  # @return [Boolean]
  def occupied?(position)
    !free?(position)
  end

  # @param position [::TickTackToe::Position]
  # @param mark     [Integer]
  #
  # @return [self]
  def set(position, mark)
    @field[position.x][position.y] = mark

    self
  end

  # @param position [::TickTackToe::Position]
  #
  # @return [Integer]
  def get(position)
    @field[position.x][position.y]
  end
end
