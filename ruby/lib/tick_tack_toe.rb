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

  # @!attribute [r] SIGN2MARK_MAP
  #   @return [Hash{String=>Integer}]
  SIGN2MARK_MAP = {
    # GOTCHA: this mapping is present here only for symmetry, but does not
    #   actually used as there is no user which can make a move with
    #   EMPTY_SIGN.
    EMPTY_SIGN => EMPTY_BOARD_CELL_MARK,
    CROSS_SIGN => CROSS_BOARD_CELL_MARK,
    ZERO_SIGN  => ZERO_BOARD_CELL_MARK,
  }.freeze

  # @!attribute [r] MARK2SIGN_MAP
  #   @return [Hash{Integer=>String}]
  MARK2SIGN_MAP = {
    EMPTY_BOARD_CELL_MARK => EMPTY_SIGN,
    CROSS_BOARD_CELL_MARK => CROSS_SIGN,
    ZERO_BOARD_CELL_MARK  => ZERO_SIGN,
  }.freeze

  # @!attribute [r] PLAYERS_SIGNS_LIST
  #   @return [Array<String>]
  PLAYERS_SIGNS_LIST = [
    CROSS_SIGN,
    ZERO_SIGN,
  ].freeze


  class << self
    # @param sign [String]
    #
    # @return [Integer]
    def sign2mark(sign)
      SIGN2MARK_MAP[sign]
    end

    # @param mark [Integer]
    #
    # @return [String]
    def mark2sign(mark)
      MARK2SIGN_MAP[mark]
    end
  end
end


require "tick_tack_toe/position"
require "tick_tack_toe/player"
require "tick_tack_toe/board"
require "tick_tack_toe/game"
require "tick_tack_toe/cli"

require "tick_tack_toe/container"
