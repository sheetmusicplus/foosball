require 'spec_helper'

RSpec.describe Persistence::Repos::PlayerRepo do
  describe '#all' do
    let!(:player_one) { Fabricate(:player, name: 'Romeo') }
    let!(:player_two) { Fabricate(:player, name: 'Victor') }
    let!(:player_three) { Fabricate(:player, name: 'Juliet') }

    it 'returns an all names sorted in an alphabetical order' do
      players = subject.all
      expect(players).to eq([player_three, player_one, player_two])
    end
  end

  describe '#find' do
    let!(:player) { Fabricate(:player) }

    it 'returns a player' do
      expect(subject.find(player.id)).to eq(player)
    end
  end

  describe '#save' do
    let(:active_record) { Persistence::Private::Player }

    context 'an entity with no id' do
      let(:entity) { Fabricate(:player_entity) }

      it 'creates a new player record' do
        expect {
          subject.save(entity)
        }.to change(active_record, :count).by(1)
      end
    end

    context 'an entity with an id' do
      let!(:player) { Fabricate(:player) }
      let(:entity) { Fabricate(:player_entity, id: player.id) }

      it 'updates an existing player record' do
        expect {
          subject.save(entity)
        }.not_to change(active_record, :count)
      end
    end
  end
end
