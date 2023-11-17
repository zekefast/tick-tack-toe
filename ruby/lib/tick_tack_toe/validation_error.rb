# frozen_string_literal: true

# User input validation errors.
class ::TickTackToe::ValidationError < ::RuntimeError
  include ::TickTackToe::Error


  # @param coordinate_name  [Symbol]
  # @param coordinate_value [String]
  #
  # @return [::TickTackToe::ValidationError]
  def self.coordinate_is_not_an_integer_error(_coordinate_name, _coordinate_value)
    new("you must enter the x and y coordinates separated by spaces")
  end

  # @param board_size       [Integer]
  # @param coordinate_name  [Symbol]
  # @param coordinate_value [Integer]
  #
  # @return [::TickTackToe::ValidationError]
  def self.coordinate_are_outside_of_playable_area(_board_size, _coordinate_name, _coordinate_value)
    new("those coordinates are outside of the playable area")
  end
end
