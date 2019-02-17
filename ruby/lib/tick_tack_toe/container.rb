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

  # @return [::TickTackToe::Cli]
  def cli
    ::TickTackToe::Cli.new(
      board_printer
    )
  end
end
