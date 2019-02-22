# frozen_string_literal: true

class ::TickTackToe::ValidationError < ::RuntimeError
  include ::TickTackToe::Error


  # @param coordinate_name  [Symbol]
  # @param coordinate_value [String]
  #
  # @return [::TickTackToe::ValidationError]
  def self.coordinate_is_not_an_integer_error(coordinate_name, coordinate_value)
    self.new("you must enter the x and y coordinates separated by spaces")
  end

  # @param board_size       [Integer]
  # @param coordinate_name  [Symbol]
  # @param coordinate_value [Integer]
  #
  # @return [::TickTackToe::ValidationError]
  def self.coordinate_are_outside_of_playable_area(board_size, coordinate_name, coordinate_value)
    self.new("those coordinates are outside the playable area")
  end
end
