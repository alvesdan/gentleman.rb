module Gentleman
  module Selectors
    class Where < Selector

      FORMAT_REGEX = /\Awhere\s+{1}(am i)\?\z/i

      def execute
        case target
        when /am i/i
          $console.say Dir.pwd
        else
          $console.say "Sorry #{$user}, what do you mean?"
        end
      end

      private

      def target
        user_input.match(FORMAT_REGEX).captures.first.strip
      end
    end
  end
end
