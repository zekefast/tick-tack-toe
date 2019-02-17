# frozen_string_literal: true

class ::TickTackToe::Player
  # @!attribute [r] sign
  #   @return [String]
  # @!attribute [r] name
  #   @return [String]
  attr_reader \
    :sign,
    :name


  # @param sign [String]
  # @param name [String]
  #
  # @return [void]
  def initialize(sign, name)
    @sign = sign
    @name = name
  end
end
