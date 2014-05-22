module Gentleman
  class Base

    @@actions = {}
    @@handlers = {}

    attr_reader :entry, :action, :target, :handler

    def self.register_action(action, class_name)
      @@actions[action] = class_name
    end

    def self.register_handler(handler, class_name)
      @@handlers[handler] = class_name
    end

    register_action :search, 'Search'
    register_action :delete, 'Delete'
    register_handler :list, 'List'
    register_handler :count, 'Count'

    def initialize(entry)
      @entry = Gentleman::Entry.new(entry, @@actions, @@handlers)
    end

    def execute
      if @entry.valid?
        handle_response(lookup_target)
      else
        'Sorry Sir, I could not understand you.'
      end
    end

    private

    def lookup_target
      Gentleman::Action.const_get(@@actions[@entry.action]).handle(@entry.target)
    end

    def handle_response(files)
      Gentleman::Handler.const_get(@@handlers[@entry.handler]).handle(files)
    end

  end
end
