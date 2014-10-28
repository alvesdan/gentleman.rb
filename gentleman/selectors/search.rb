module Gentleman
  module Selectors
    class Search < Selector

      FORMAT_REGEX = /\Asearch\s+{1}(.+)\z/

      def execute
        if results.size > 0
          $console.say "I found [c:color]#{pluralize(results.count, 'file', 'files')}[c:clean], what do you want to do?"
          interact
        else
          $console.say "Sorry #{$user}, I could not find any file."
        end
      end

      private

      def results
        Dir.glob("#{Dir.pwd}/**/*").find_all do |pathfile|
          pathfile =~ /#{target}/i && File.file?(pathfile)
        end
      end

      def target
        user_input.match(FORMAT_REGEX).captures.first.strip
      end
    end
  end
end
