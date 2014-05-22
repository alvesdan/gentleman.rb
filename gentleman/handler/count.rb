module Gentleman
  module Handler
    class Count

      def self.handle(target)
        ["Total of #{target.size} files found."]
      end
    end
  end
end
