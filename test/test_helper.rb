# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require_relative 'fixtures/files/stubs'
require 'rails/test_help'
require 'minitest/autorun'
require 'pry'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)
    # parallelize(workers: 1)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    include Devise::Test::IntegrationHelpers

    def log_in(user)
      login_as(user, scope: :user)
    end

    def log_out
      sign_out(:user)
    end
  end
end
