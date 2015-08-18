$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'persistence'

require 'database_cleaner'
require 'fabrication'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'test/dummy/db/test.sqlite3',
  pool: 5,
  timeout: 5000,
)

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
