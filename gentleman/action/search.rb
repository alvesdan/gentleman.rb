module Gentleman
  module Action
    class Search

      def self.handle(target)
        Dir.glob("#{Dir.pwd}/**/*").find_all { |pathfile|
          pathfile =~ /#{target}/ && File.file?(pathfile)
        }
      end
    end
  end
end
