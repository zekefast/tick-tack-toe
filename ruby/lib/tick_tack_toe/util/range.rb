# frozen_string_literal: true

# Refine Range class and fix it by handle reverse ranges similarly to
# forward one.
#
# @example
#
#   # Forward Range is perfectly fine
#   (0..5).to_a # => [0, 1, 2, 3, 4, 5]
#
#   # Bu we have a problem with reverse Range
#   (5..0).to_a # => []
#
#   # But using refinement we can fix it
#   using ::TickTackToe::Util::ReverseRange
#
#   (5..0).to_a # =>
#
# @note Despite this refinement provides fixed implementation of #each method
#   which is enough for current application it is still incomplete and
#   other methods like #to_a, #min, #max and others still misbehaive.
module ::TickTackToe::Util::ReverseRange
  refine Range do
    private def reverse?
      first > last
    end

    def each(&block)
      return first.downto(last, &block) first.respond_to?(:pred) && reverse?

      super
    end
  end
end
