require 'spec_helper'

describe SerializedObjects::Model do
  subject { described_class.create(Item.new, ItemSerializer) }

  it 'allows to call attributes as methods' do
    expect(subject.name).to eq('test')
  end

  it 'raises exception when attribute does not exist' do
    expect { subject.foo }.to raise_exception(KeyError)
  end

  it 'allows to call attributes as hash attributes' do
    expect(subject.to_h[:name]).to eq('test')
  end
end