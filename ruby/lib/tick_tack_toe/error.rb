# frozen_string_literal: true

# Purpose: mixin
#
# This module should be mixed into all exceptions of ::RuntimeError type.
# In most situation those error should be catched and logged. Usually they
# signals about incorrect way of execution which is based on data received
# during runtime, unexpected data, catched and reraised exceptions from used
# libraries, etc.
#
# @see ::TickTackToe::StandardError
module ::TickTackToe::Error
end
