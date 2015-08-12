require 'spec_helper'

RSpec.describe Foosball::Concepts::Player do
  let(:player_repo) { double }

  describe 'List' do
    subject do
      described_class::List.new(
        player_repo:  player_repo,
        observer:     self
      )
    end

    it { is_expected.to be_kind_of(Foosball::Concepts::Operation) }

    it 'must execute with a success response and run the on success hook' do
      @success_callback = nil

      subject.on_success -> (observer, _) {
        observer.instance_eval { @success_callback = true }
      }

      expect(player_repo).to receive(:all)
      res, _ = subject.execute

      expect(res).to eq(true)
      expect(@success_callback).to eq(true)
    end
  end

  describe 'Create' do
    let(:player_attributes) { {} }

    subject do
      described_class::Create.new(
        attributes:   player_attributes,
        player_repo:  player_repo,
        observer:     self
      )
    end

    it { is_expected.to be_kind_of(Foosball::Concepts::Operation) }

    context 'with valid attributes' do
      let(:player_attributes) { { name: 'Player' } }

      it 'must execute with a success response and run the on success hook' do
        @success_callback = nil

        subject.on_success -> (observer, _) {
          observer.instance_eval { @success_callback = true }
        }

        expect(player_repo).to receive(:save)
        res, _ = subject.execute

        expect(res).to eq(true)
        expect(@success_callback).to eq(true)
      end
    end

    context 'without valid attributes' do
      it 'must execute with a failed response and run the on errors hook' do
        @errors_callback = nil

        subject.on_errors -> (observer, _) {
          observer.instance_eval { @errors_callback = true }
        }

        expect(player_repo).not_to receive(:save)
        res, _ = subject.execute

        expect(res).to eq(false)
        expect(@errors_callback).to eq(true)
      end
    end
  end

  describe 'Read' do
    subject do
      described_class::Read.new(
        player_id:    1,
        player_repo:  player_repo,
        observer:     self
      )
    end

    it 'must execute with a success response and run the on success hook' do
      @success_callback = nil

      subject.on_success -> (observer, _) {
        observer.instance_eval { @success_callback = true }
      }

      expect(player_repo).to receive(:find).with(1)
      res, _ = subject.execute

      expect(res).to eq(true)
      expect(@success_callback).to eq(true)
    end
  end
end
