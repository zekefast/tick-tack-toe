# frozen_string_literal: true

class ::TickTackToe::Cli
  # @!attribute [r] board_printer
  #   @return [#call]
  # @!attribute [r] player_factory
  #   @return [#call]
  attr_reader \
    :board_printer,
    :player_factory


  # @param board_printer  [#call]
  # @param player_factory [#call]
  #
  # @return [void]
  def initialize(board_printer, player_factory)
    @board_printer  = board_printer
    @player_factory = player_factory
  end

  # @return [self]
  def call
    puts "No implementation of Tick Tack Toe yet."

    self
  end
end


require "tick_tack_toe/cli/board_printer"
