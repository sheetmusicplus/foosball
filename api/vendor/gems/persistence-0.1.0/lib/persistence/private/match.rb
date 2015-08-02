require 'active_record'

module Persistence
  module Private
    class Match < ActiveRecord::Base
      belongs_to :winner, class_name: 'Player'
      belongs_to :loser,  class_name: 'Player'
    end
  end
end
