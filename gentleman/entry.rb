module Gentleman
  class Entry

    attr_reader :entry
    HANDLER_SEPARATOR = 'then'

    def initialize(string, actions, handlers)
      @entry = string
      @actions = actions
      @handlers = handlers
    end

    def valid?
      /\A(#{action_options})\s+[\S]+[\s+]?#{HANDLER_SEPARATOR}?\s+?(#{handler_options})?/.match(@entry)
    end

    def has_handler?
      entry =~ /#{HANDLER_SEPARATOR}\s/
    end

    def action
      where_to_search_target.split(/\s+/).first.to_sym
    end

    def target
      where_to_search_target.split(/\s+/).last.gsub(/\A\"|\"\Z/, '')
    end

    def handler
      entry.split(/\s+#{HANDLER_SEPARATOR}\s+/).last.to_sym
    end

    private

      def action_options
        @actions.keys.join('|')
      end

      def handler_options
        @handlers.keys.join('|')
      end

      def where_to_search_target
        has_handler? ? entry.split(/\s+#{HANDLER_SEPARATOR}\s+/).first : entry
      end
  end
end
