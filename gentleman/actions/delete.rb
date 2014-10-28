module Gentleman
  module Actions
    class Delete < Action

      ACTION_TEXT = 'Delete'
      ACTION_REGEX = /delete/i

      def execute
        interact
      end

      def interact
        answer = $console.ask 'Do you really want to delete these files?'
        delete_files if answer =~ /yes/i
      end

      private

      def delete_files
        results.each do |file|
          FileUtils.rm file
          $console.say "Deleted [c:color]#{file}[c:clean]"
        end
        nil
      end

    end
  end
end
