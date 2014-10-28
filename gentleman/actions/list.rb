module Gentleman
  module Actions
    class List < Action

      ACTION_TEXT = 'List'
      ACTION_REGEX = /list/i

      def execute
        $console.say formatted_output
        $console.br

        $console.say 'Anything else?'
        selector.interact
      end

      private

      def formatted_output
        results.map { |file| formatted_file_name(file) }
      end

      def formatted_file_name(file)
        match_string = file.match(/(#{target})/i).captures.first
        file.gsub(/(#{target})/i, "\e[4;32m#{match_string}\e[0m")
      end

    end
  end
end
