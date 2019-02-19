# frozen_string_literal: true

# Print Tick Tack Toe field of a given size of the board.
# Example:
#   \x  0   1   2
#   y\~~~~~~~~~~~~~
#   0 |   |   |   |
#     ~~~~~~~~~~~~~
#   1 |   |   |   |
#     ~~~~~~~~~~~~~
#   2 |   |   |   |
#     ~~~~~~~~~~~~~
class ::TickTackToe::Cli::BoardPrinter
  # @!attribute [r] ROW_SEPARATOR
  #   @return [String]
  ROW_SEPARATOR    = "~"

  # @!attribute [r] COLUMN_SEPARATOR
  #   @return [String]
  COLUMN_SEPARATOR = "|"


  # @param board_size [Integer]
  #
  # @return [void]
  def header(board_size)
    puts
    print("\\x ")
    board_size.times { |i| print(" #{i}  ") }
    puts
  end

  # @param board_size [Integer]
  # @param prefix     [String] ("  ")
  #
  # @return [void]
  def separator(board_size, prefix = "  ")
    print(prefix)
    print(ROW_SEPARATOR*(1 + board_size*4))
    puts
  end

  # @param board [::TickTackToe::Board]
  # @param index [Integer]
  #
  # @return [void]
  def row(board, index)
    print "#{index} #{COLUMN_SEPARATOR}"
    board.size.times do |j|
      print " #{::TickTackToe::MARK2SIGN_MAP[board.get(::TickTackToe::Position.new(j, index))]} #{COLUMN_SEPARATOR}"
    end
    puts
  end

  # @return [void]
  def footer
    puts
  end

  # @param board [::TickTackToe::Board]
  #
  # @return [self]
  def call(board)
    header(board.size)
    separator(board.size, "y\\")
    board.size.times do |row_index|
      row(board, row_index)
      separator(board.size)
    end
    footer

    self
  end
end
