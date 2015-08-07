require 'spec_helper'

RSpec.describe Foosball::Concepts::Player do
  let(:player_repo) { double }

  describe 'List' do
    subject { described_class::List.new(player_repo: player_repo) }

    it 'must execute' do
      expect(player_repo).to receive(:all)
      subject.execute
    end
  end

  describe 'Create' do
    context 'with valid attributes' do
      subject { described_class::Create.new(attributes: { name: 'Player' }, player_repo: player_repo) }

      it 'must execute' do
        expect(player_repo).to receive(:save)
        subject.execute
      end
    end

    context 'without valid attributes' do
      subject { described_class::Create.new(attributes: {}, player_repo: player_repo) }

      it 'must execute' do
        expect(player_repo).not_to receive(:save)
        subject.execute
      end
    end
  end

  describe 'Read' do
    subject { described_class::Read.new(player_id: 1, player_repo: player_repo) }

    it 'must execute' do
      expect(player_repo).to receive(:find).with(1)
      subject.execute
    end
  end
end
