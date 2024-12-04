ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

#Use Spec DSL
require 'minitest/spec'

#Helpers
require 'capybara/rails'
require 'mocha/minitest'

Minitest::Reporters.use!(Minitest::Reporters::ProgressReporter.new(color: true), ENV, Minitest.backtrace_filter) 

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    #fixtures :all

    # Add more helper methods to be used by all tests here...
    extend Minitest::Spec::DSL
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
