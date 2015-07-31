class MatchSerializer < ActiveModel::Serializer
  attributes :id, :winner_id, :loser_id, :occured_at
end
