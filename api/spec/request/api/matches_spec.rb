require 'rails_helper'

RSpec.describe 'Api::Matches', type: :request do
  describe 'index' do
    let!(:match) { create(:match) }
    let(:serializer) { MatchSerializer.new(match) }

    it 'must return a collection of matches' do
      get '/api/matches'

      expect(response.code).to eq('200')
      expect(response.body).to eq({ matches: [serializer.attributes] }.to_json)
    end
  end

  describe 'show' do
    let(:match) { create(:match) }
    let(:serializer) { MatchSerializer.new(match) }

    it 'must show a player' do
      get "/api/matches/#{match.id}"

      expect(response.code).to eq('200')
      expect(response.body).to eq({ match: serializer.attributes }.to_json)
    end
  end

  describe 'create' do
    let(:winner) { create(:player) }
    let(:loser) { create(:player) }

    it 'must create a new match' do
      expect {
        post '/api/matches', params: { match: { winner_id: winner.id, loser_id: loser.id } }
      }.to change(Persistence::Repos::MatchRepo, :count).by(1)

      expect(response.code).to eq('201')

      serializer = MatchSerializer.new(Persistence::Repos::MatchRepo.first)
      expect(response.body).to eq({ match: serializer.attributes }.to_json)
    end
  end
end
