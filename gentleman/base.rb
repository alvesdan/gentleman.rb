module Gentleman
  class Base

    $user = ENV['GENTLEMAN_USER'] || 'Sir'
    $console = ::Gentleman::Console.new
    @@selectors = []

    def self.register_selector(klass:, actions:)
      @@selectors << {
        klass: klass,
        actions: actions
      }
    end

    register_selector klass: ::Gentleman::Selectors::Search,
      actions: [
        Actions::List,
        Actions::Move,
        Actions::Rename,
        Actions::Delete
      ]

    register_selector klass: ::Gentleman::Selectors::Where, actions: []

    attr_reader :user_input
    def initialize(entries)
      @user_input = ::Gentleman::UserInput.new(entries, @@selectors)
    end

    def execute
      return user_input.execute if user_input.valid?

      if user_input.entry.empty?
        $console.say "Yes, #{$user}!"
      else
        $console.say "Sorry #{$user}, I could not understand you."
      end
    end

  end
end
