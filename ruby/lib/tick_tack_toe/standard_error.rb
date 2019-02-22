# frozen_string_literal: true

# Purpose: mixin
#
# This module should be mixed into all exceptions of ::StandardError type.
# In most situation those errors should not be catched. They signals about incorrect
# usages of interfaces, about code written in incorrect way, unoverrided methods
# provided by "abstract" classes or modules, etc.
#
# In most cases you can suppose that errors which include this module would be
# catched on compilation if Ruby would be statically typed language.
#
# @see ::TickTackToe::Error
module ::TickTackToe::StandardError
end
