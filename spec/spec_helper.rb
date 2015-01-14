require 'rubygems'

require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.expect_with :rspec do |expect_config|
    expect_config.syntax = :expect
  end

  config.raise_errors_for_deprecations!
  config.infer_spec_type_from_file_location!
  config.render_views
  config.include(FactoryGirl::Syntax::Methods)
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
