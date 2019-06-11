# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
spec_root = File.expand_path('..', __FILE__)
require File.expand_path("dummy/config/environment.rb",  spec_root)

require 'pry'
require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_bot_rails'
require 'shoulda-kept-assign-to'
require 'database_cleaner'
require 'rails-controller-testing'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Rails::Controller::Testing::TemplateAssertions, type: :controller

  config.infer_spec_type_from_file_location!
  config.before :suite do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:active_record].clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner[:active_record].start
  end

  config.after :each do
    DatabaseCleaner[:active_record].clean
  end
  config.expect_with(:rspec) { |c| c.syntax = :should }

end

Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }
ActiveRecord::Migration.maintain_test_schema!
# ActiveRecord::Migrator.migrate(File.expand_path("dummy/db/migrate/", spec_root))
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end