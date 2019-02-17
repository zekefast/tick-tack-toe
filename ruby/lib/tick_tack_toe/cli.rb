# frozen_string_literal: true

class ::TickTackToe::Cli
  # @!attribute [r] board_printer
  #   @return [#call]
  # @!attribute [r] player_factory
  #   @return [#call]
  # @!attribute [r] game_factory
  #   @return [#call]
  attr_reader \
    :board_printer,
    :player_factory,
    :game_factory


  # @param board_printer  [#call]
  # @param player_factory [#call]
  # @param game_factory   [#call]
  #
  # @return [void]
  def initialize(board_printer, player_factory, game_factory)
    @board_printer  = board_printer
    @player_factory = player_factory
    @game_factory   = game_factory
  end

  # @return [self]
  def call
    banner

    self
  end

  # @return [self]
  def banner
    puts "\n  Tick Tack Toe\n\n"

    self
  end
end


require "tick_tack_toe/cli/board_printer"
