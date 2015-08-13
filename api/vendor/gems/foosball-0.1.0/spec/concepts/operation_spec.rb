require 'spec_helper'

RSpec.describe Foosball::Concepts::Operation do
  it { is_expected.to be_kind_of(Hooks) }
  it { is_expected.to be_kind_of(Hooks::InstanceHooks) }

  describe '#run' do
    context 'given a truthy response' do
      it 'calls the on success hook' do
        @success_callback = nil

        subject.on_success -> (observer, op) {
          observer.instance_eval { @success_callback = true }
          observer.expect(op).to observer.be_nil
        }

        subject.send(:run, observer: self) { [true, nil] }
        expect(@success_callback).to eq(true)
      end
    end

    context 'given a falsey response' do
      it 'calls the on errors hook' do
        @errors_callback = nil

        subject.on_errors -> (observer, op) {
          observer.instance_eval { @errors_callback = true }
          observer.expect(op).to observer.be_nil
        }

        subject.send(:run, observer: self) { [false, nil] }
        expect(@errors_callback).to eq(true)
      end
    end
  end
end
