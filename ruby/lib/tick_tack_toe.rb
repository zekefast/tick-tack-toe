# frozen_string_literal: true

# Purpose: namespace
#
# Namespace for TickTackToe set of classes and modules.
module ::TickTackToe
  # @!attribute [r] EMPTY_SIGN
  #   @return [String]
  #
  # GOTCHA: this constant is only used at the time of printing board when it
  #   is necessary to output absence of signs indicated by
  #   EMPTY_BOARD_CELL_MARK constant on the board.
  EMPTY_SIGN = " "

  # @!attribute [r] CROSS_SIGN
  #   @return [String]
  CROSS_SIGN = "X"

  # @!attribute [r] ZERO_SIGN
  #   @return [String]
  ZERO_SIGN  = "0"


  # @!attribute [r] EMPTY_CELL
  #   @return [Integer]
  EMPTY_BOARD_CELL_MARK = 0

  # @!attribute [r] CROSS_CELL
  #   @return [Integer]
  CROSS_BOARD_CELL_MARK = 1

  # @!attribute [r] ZERO_CELL
  #   @return [Integer]
  ZERO_BOARD_CELL_MARK  = -1

  # @!attribute [r] MARK2SIGN_MAP
  #   @return [Hash{Integer=>String}]
  MARK2SIGN_MAP = {
    EMPTY_BOARD_CELL_MARK => EMPTY_SIGN,
    CROSS_BOARD_CELL_MARK => CROSS_SIGN,
    ZERO_BOARD_CELL_MARK  => ZERO_SIGN,
  }.freeze
end


require "tick_tack_toe/position"
require "tick_tack_toe/player"
require "tick_tack_toe/board"
require "tick_tack_toe/game"
require "tick_tack_toe/cli"

require "tick_tack_toe/container"
