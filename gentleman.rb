require_relative 'gentleman/base'
require_relative 'gentleman/entry'
require_relative 'gentleman/action/search'
require_relative 'gentleman/handler/list'
require_relative 'gentleman/handler/count'

module Gentleman
end

puts Gentleman::Base.new(ARGV[0]).execute unless defined?(Rspec)
