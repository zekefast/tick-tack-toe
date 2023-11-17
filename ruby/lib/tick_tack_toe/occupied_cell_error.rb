# frozen_string_literal: true

# An error for the case when user input a position on the board
# which has been occupied already by previous moves.
class ::TickTackToe::OccupiedCellError < ::RuntimeError
  include ::TickTackToe::Error


  # @param position [::TickTackToe::Position]
  #
  # @return [::TickTackToe::OccupiedCellError]
  def self.occupied_cell_error(_position)
    new("that space is already taken")
  end
end
