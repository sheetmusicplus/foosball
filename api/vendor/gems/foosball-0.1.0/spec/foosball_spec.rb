require 'spec_helper'
require 'support/fake_repositories'

describe Foosball do
  let(:player_repo) { Fake::PlayerRepo.new }

  it 'has a version number' do
    expect(Foosball::VERSION).not_to be nil
  end

  describe 'present players' do
    let!(:player) do
      _, op = create_player
      return op
    end

    it 'must include a player' do
      @success_callback = nil

      res, op = subject.present_players(player_repo: player_repo, observer: self) do |o|
        o.on_success -> (observer, _) {
          observer.instance_eval { @success_callback = true }
        }
      end

      expect(res).to eq(true)
      expect(op).to include(player)
      expect(@success_callback).to eq(true)
    end
  end

  describe 'present player' do
    let(:player) do
      _, op = create_player
      return op
    end

    it 'must be a player' do
      @success_callback = nil

      res, op = subject.present_player(player_id: player.id, player_repo: player_repo, observer: self) do |o|
        o.on_success -> (observer, _) {
          observer.instance_eval { @success_callback = true }
        }
      end

      expect(res).to eq(true)
      expect(op).to eq(player)
      expect(@success_callback).to eq(true)
    end
  end

  describe 'create player' do
    it 'must create a player' do
      @success_callback = nil

      res, op = create_player do |o|
        o.on_success -> (observer, _) {
          observer.instance_eval { @success_callback = true }
        }
      end

      expect(res).to eq(true)
      expect(op).to be_kind_of(Foosball::Entities::Player)
      expect(op.id).not_to be nil
      expect(@success_callback).to eq(true)
    end
  end

  private

  def create_player(&block)
    subject.create_player(
      attributes: { name: 'Player' },
      player_repo: player_repo,
      observer: self,
      &block
    )
  end
end
