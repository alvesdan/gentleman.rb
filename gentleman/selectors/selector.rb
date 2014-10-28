module Gentleman
  module Selectors
    class Selector

      include ::Gentleman::Helpers

      attr_reader :user_input, :actions
      def initialize(user_input, actions)
        @user_input = user_input
        @actions = actions
      end

      def interact
        answer = $console.ask(options)
        return run_action_for(answer) if action_for(answer)
        execute
      end

      private

      def results
        raise 'Not implemented'
      end

      def options
        actions.map { |action| action::ACTION_TEXT }.join(', ')
      end

      def action_for(answer)
        actions.find { |action| answer =~ action::ACTION_REGEX }
      end

      def run_action_for(answer)
        action_for(answer).new(self, target, results).execute
      end
    end
  end
end

require_relative './search'
require_relative './where'
