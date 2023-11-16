# frozen_string_literal: true

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
