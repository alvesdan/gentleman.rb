module Gentleman
  class UserInput

    attr_reader :entry, :selectors
    def initialize(entries, selectors)
      @entry = entries.join(' ').strip
      @selectors = selectors
    end

    def valid?
      !target_selector.nil?
    end

    def target_selector
      selectors.find { |selector| entry =~ selector[:klass]::FORMAT_REGEX }
    end

    def execute
      target_selector[:klass].new(entry, target_selector[:actions]).execute
    end
  end
end
