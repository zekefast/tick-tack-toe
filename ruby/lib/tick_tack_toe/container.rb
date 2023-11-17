# frozen_string_literal: true

# Instantiates classes and wire dependencies between them.
#
# In some cases, for parametrized service points
# (aka just container's methods), direct instantiation can't be used as
# parameters (aka data) isn't available at the moment of dependency injection.
# In such situations BoundMethod instance (call to method()) is captured
# and it is injected as a factory method.
#
# One of such example is a player which can't be instantiated inside container
# directly as it requires a name of the player which is requested from user.
# So, we inject a BoundMethod instance into Cli to it can create players once
# it received an input from user about their names.
class ::TickTackToe::Container
  # @return [::TickTackToe::Cli::BoardPrinter]
  def board_printer
    ::TickTackToe::Cli::BoardPrinter.new
  end

  # @return [::TickTackToe::Board]
  def board
    ::TickTackToe::Board.new(::TickTackToe::Board::STANDARD_SIZE)
  end

  # @param sign [String]
  # @param name [String]
  #
  # @return [::TickTackToe::Player]
  def player(sign, name)
    # GOTCHA: As player requires a name to be instantiated we add
    #   parameters to creation method to provide them later from user's intput.
    ::TickTackToe::Player.new(sign, name, ::TickTackToe.sign2mark(sign))
  end

  # @param players [Array<::TickTackToe::Player>]
  #
  # @return [::TickTackToe::Game]
  def game(players)
    # GOTCHA: As game requires players to be instantiated we add
    #   parameter to creation method to provide it later once players were instantiated.
    ::TickTackToe::Game.new(board, players)
  end

  # @return [::TickTackToe::Cli]
  def cli
    ::TickTackToe::Cli.new(
      board_printer,
      method(:player),
      method(:game)
    )
  end
end
