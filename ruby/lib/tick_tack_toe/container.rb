# frozen_string_literal: true

class ::TickTackToe::Container
  # @return [::TickTackToe::Board]
  def board
    ::TickTackToe::Board.new(::TickTackToe::Board::STANDARD_SIZE)
  end

  # @return [::TickTackToe::Cli]
  def cli
    ::TickTackToe::Cli.new
  end
end
