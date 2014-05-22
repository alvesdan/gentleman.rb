module Gentleman
  module Handler
    class List

      def self.handle(target)
        target.map { |file| "- #{file}" }
      end
    end
  end
end
