# frozen_string_literal: true

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
