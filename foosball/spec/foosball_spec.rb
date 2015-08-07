require 'spec_helper'
require 'support/fake_repositories'

describe Foosball do
  let(:player_repo) { Fake::PlayerRepo.new }

  it 'has a version number' do
    expect(Foosball::VERSION).not_to be nil
  end

  describe 'present players' do
    let!(:player) { create_player }

    it 'must include a player' do
      actual = subject.present_players(player_repo: player_repo)
      expect(actual).to include(player)
    end
  end

  describe 'present player' do
    let(:player) { create_player }

    it 'must be a player' do
      actual = subject.present_player(player_id: player.id, player_repo: player_repo)
      expect(actual).to eq(player)
    end
  end

  describe 'create player' do
    it 'must create a player' do
      actual = create_player
      expect(actual).to be_kind_of(Foosball::Entities::Player)
      expect(actual.id).not_to be nil
    end
  end

  private

  def create_player
    subject.create_player(
      attributes: { name: 'Player' },
      player_repo: player_repo
    )
  end
end
