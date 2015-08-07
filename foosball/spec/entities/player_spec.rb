require 'spec_helper'

RSpec.describe Foosball::Entities::Player do
  it { expect(subject).to be_kind_of Lotus::Validations }
  its(:valid?) { is_expected.to be false }

  context 'given valid attributes' do
    subject { described_class.new(id: 1, name: 'Player') }

    its(:id) { is_expected.to eq(1) }
    its(:name) { is_expected.to eq('Player') }

    its(:valid?) { is_expected.to be true }
  end
end
