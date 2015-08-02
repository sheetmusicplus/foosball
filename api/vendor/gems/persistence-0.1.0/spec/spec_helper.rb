# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# require 'persistence'

require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'test/dummy/db/test.sqlite3',
  pool: 5,
  timeout: 5000,
)
