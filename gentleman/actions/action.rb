module Gentleman
  module Actions
    class Action

      attr_reader :selector, :target, :results
      def initialize(selector, target, results)
        @selector = selector
        @target = target
        @results = results
      end
    end
  end
end

require_relative './list'
require_relative './move'
require_relative './delete'
require_relative './rename'
