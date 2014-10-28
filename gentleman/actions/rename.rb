module Gentleman
  module Actions
    class Rename < Action

      ACTION_TEXT = 'Rename'
      ACTION_REGEX = /rename/i

      def execute
        interact
      end

      def interact
        answer = $console.ask 'Please, type the new file name pattern'
        rename_files(answer)
      end

      private

      def rename_files(pattern)
        if results.size > 1
          confirm = $console.ask "I will rename #{results.count} files using the pattern [c:color]#{pattern}_{n}.{extension}[c:clean]"
          return nil unless confirm =~ /yes/i
          results.each_with_index do |file, index|
            rename_file(file, "#{pattern}_#{index + 1}")
          end
          nil
        else
          file = results.first
          rename_file(file, pattern)
          nil
        end
      end

      def rename_file(file, pattern)
        file_name = [File.dirname(file), "#{pattern}#{File.extname(file)}"].join('/')
        FileUtils.mv file, file_name

        $console.say "Renamed [c:color]#{file}[c:clean] to [c:color]#{file_name}[c:clean]"
      end

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
