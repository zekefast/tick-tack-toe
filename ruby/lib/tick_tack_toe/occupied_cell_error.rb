# frozen_string_literal: true

class ::TickTackToe::OccupiedCellError < ::RuntimeError
  include ::TickTackToe::Error


  # @param position [::TickTackToe::Position]
  #
  # @return [::TickTackToe::OccupiedCellError]
  def self.occupied_cell_error(position)
    self.new("that space is already taken")
  end
end
