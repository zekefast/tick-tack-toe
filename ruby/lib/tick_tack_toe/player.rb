# frozen_string_literal: true

# Represents user in the game and contains all its state.
#
# *sign* is a representation of the player's moves on a visible board
# produced by ::TickTackToe::Cli::BoardPrinter class.
# *mark* is a representation of the player's moves inside of internal state
# (aka instance of ::TickTackToe::Board class) which then transformed
# to the user by ::TickTackToe::Cli::BoardPrinter.
class ::TickTackToe::Player
  # @!attribute [r] sign
  #   @return [String]
  # @!attribute [r] name
  #   @return [String]
  # @!attribute [r] mark
  #   @return [Integer]
  attr_reader \
    :sign,
    :name,
    :mark


  # @param sign [String]
  # @param name [String]
  # @param mark [Integer]
  #
  # @return [void]
  def initialize(sign, name, mark)
    @sign = sign
    @name = name
    @mark = mark
  end
end
