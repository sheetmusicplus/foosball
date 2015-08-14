require 'foosball_cli/version'

require 'dotenv'
Dotenv.load

require 'foosball'
require 'persistence'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

module FoosballCli
  # Your code goes here...
end
