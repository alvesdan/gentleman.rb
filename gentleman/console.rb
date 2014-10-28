require 'readline'
module Gentleman
  class Console

    def say(message)
      STDOUT.puts format_output(message)
    end

    def ask(question)
      say format_output(question)
      answer = Readline.readline("\e[1;32m> ", true)
      STDOUT.print "\e[0m"
      return answer unless answer =~ /\A(never mind|quit|exit)\z/i

      abort('Bye!')
    end

    def br
      say ''
    end

    private

    def format_output(str)
      return str unless str.is_a?(String)
      str.gsub('[c:color]', "\e[4;33m").gsub('[c:clean]', "\e[0m")
    end
  end
end
