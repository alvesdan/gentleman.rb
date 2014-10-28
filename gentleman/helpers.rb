module Gentleman
  module Helpers

    def pluralize(count, singular, plural)
      word = count > 1 ? plural : singular
      [count, word].join(' ')
    rescue
      [count, singular].join('')
    end

  end
end
