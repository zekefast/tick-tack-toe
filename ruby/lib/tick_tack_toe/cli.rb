# frozen_string_literal: true

class ::TickTackToe::Cli
  # @!attribute [r] board_printer
  #   @return [#call]
  attr_reader \
    :board_printer


  # @param board_printer  [#call]
  #
  # @return [void]
  def initialize(board_printer)
    @board_printer  = board_printer
  end

  # @return [self]
  def call
    puts "No implementation of Tick Tack Toe yet."

    self
  end
end


require "tick_tack_toe/cli/board_printer"
