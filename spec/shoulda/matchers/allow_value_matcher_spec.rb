require 'spec_helper'

RSpec.describe Shoulda::Lotus::Matchers::AllowValueMatcher do
  include Shoulda::Lotus::Matchers

  it '#description' do
    matcher = allow_value('beer').for(:bar)

    expect(matcher.description).to eq "allow 'beer' to be set to 'bar'"
  end

  context 'an attribute with a validation' do
    let(:model) { Person.new }

    it 'accept a valid value' do
      expect(model).to allow_value('leo@nospam.org').for(:email)
    end

    it 'reject an invalid value' do
      expect(model).to_not allow_value('leo-at-nospam.org').for(:email)
    end
  end
end
