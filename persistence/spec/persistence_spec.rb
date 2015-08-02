require 'spec_helper'

describe Persistence do
  it 'has a version number' do
    expect(Persistence::VERSION).not_to be nil
  end
end
