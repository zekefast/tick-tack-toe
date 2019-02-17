# frozen_string_literal: true

class ::TickTackToe::Game
  # @!attribute [r] board
  #   @return [::TickTackToe::Board]
  # @!attribute [r] cross_player
  #   @return [::TickTackToe::Player]
  # @!attribute [r] zero_player
  #   @return [::TickTackToe::Player]
  attr_reader \
    :board,
    :cross_player,
    :zero_player


  # @param board        [::TickTackToe::Board]
  # @param cross_player [::TickTackToe::Player]
  # @param zero_player  [::TickTackToe::Player]
  #
  # @return [void]
  def initialize(board, cross_player, zero_player)
    @board        = board
    @cross_player = cross_player
    @zero_player  = zero_player
  end
end
