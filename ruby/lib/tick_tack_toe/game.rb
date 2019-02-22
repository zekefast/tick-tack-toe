# frozen_string_literal: true

class ::TickTackToe::Game
  # @!attribute [r] board
  #   @return [::TickTackToe::Board]
  # @!attribute [r] playes
  #   @return [Array<::TickTackToe::Player>]
  attr_reader \
    :board,
    :players


  # @param board   [::TickTackToe::Board]
  # @param players [Array<::TickTackToe::Player>]
  #
  # @return [void]
  def initialize(board, players)
    @board   = board
    @players = players
  end

  # @return [::TickTackToe::Player] winner of the game
  #
  # @yieldparam player [::TickTackToe::Player]
  # @yieldreturn [::TickTackToe::Position]
  def move
    players.cycle do |player|
      @board.set(yield(player), player.mark)
    end
  end
end
