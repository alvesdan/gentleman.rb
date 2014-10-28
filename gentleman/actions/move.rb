module Gentleman
  module Actions
    class Move < Action

      ACTION_TEXT = 'Move'
      ACTION_REGEX = /move/i

      def execute
        interact
      end

      def interact
        answer = $console.ask 'Where do you want to move the file(s) to?'
        folder = File.realpath(answer)
        confirm_files_move(folder)
      rescue
        $console.say "Sorry #{$user} but I could not find this folder."
        $console.br
        interact
      end

      private

      def confirm_files_move(folder)
        $console.say "I will move [c:color]#{results.count}[c:clean] file(s) to the folder [c:color]#{folder}[c:clean]"

        $console.br
        answer = $console.ask "Please, can I continue #{$user}?"
        move_files_to(folder) if answer =~ /yes/i
      end

      def move_files_to(folder)
        results.each do |file|
          new_file = [folder, File.basename(file)].join('/')
          FileUtils.mv file, new_file

          $console.say "Moved [c:color]#{file}[c:clean] to [c:color]#{new_file}[c:clean]"
        end

        nil
      end

    end
  end
end
