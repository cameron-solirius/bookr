ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

require 'minitest/reporters'
require 'factory_bot_rails'
require 'minitest/reporters/html_reporter'

Minitest::Reporters.use!(Minitest::Reporters::ProgressReporter.new(color: true),ENV,Minitest.backtrace_filter)

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # fixtures :all
    
    include FactoryBot::Syntax::Methods

    # Add more helper methods to be used by all tests here...
  end
end
