ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

include Warden::Test::Helpers
Warden.test_mode!

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  # Bring in for AJAX tests:
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation

    # Mock Fog calls
    # Fog.mock!
    # connection = Fog::Storage.new({
    #   :provider => 'AWS',
    #   :aws_access_key_id => 'bogus',
    #   :aws_secret_access_key => 'bogus'
    # })
    # connection.directories.create(:key => "lunarleap")
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.infer_spec_type_from_file_location!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
