require 'rails_helper'

RSpec.describe 'Api::Players', type: :request do
  describe 'index' do
    let!(:player) { create(:player) }
    let(:serializer) { PlayerSerializer.new(player) }

    it 'must return a collection of players' do
      get '/api/players'

      expect(response.code).to eq('200')
      expect(response.body).to eq({ players: [serializer.attributes] }.to_json)
    end
  end

  describe 'show' do
    let(:player) { create(:player) }
    let(:serializer) { PlayerSerializer.new(player) }

    it 'must show a player' do
      get "/api/players/#{player.id}"

      expect(response.code).to eq('200')
      expect(response.body).to eq({ player: serializer.attributes }.to_json)
    end
  end

  describe 'create' do
    it 'must create a new player' do
      expect {
        post '/api/players', params: { player: { name: Faker::Name.name } }
      }.to change(Persistence::Repos::PlayerRepo, :count).by(1)

      expect(response.code).to eq('201')

      serializer = PlayerSerializer.new(Persistence::Repos::PlayerRepo.first)
      expect(response.body).to eq({ player: serializer.attributes }.to_json)
    end
  end
end
